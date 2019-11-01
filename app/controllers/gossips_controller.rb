class GossipsController < ApplicationController

  @@num=0
  @@num2=0
  def index
    @numero = @@num
    @numero2 = @@num2
    @@num2=0
    @@num=0
  end

  def show
    if params[:id].to_i <=0
      redirect_to "/gossips"
    end

  end

  def new
    @gossip = Gossip.new()
  end

  def create
    @gossip = Gossip.new('user_id' => current_user.user_id,'title' => params[:title],'content' => params[:content])

    if @gossip.save
      redirect_to "/gossips"
      @@num = "1"
    else
      render 'new'
    end
  end


  def edit
    @gossip = Gossip.new()
  end

  def update
      # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
      # pour info, le contenu de ce formulaire sera accessible dans le hash params
      # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
      @gossip = Gossip.find(id = params[:id].to_i)
      puts @gossip
      puts "fjejfejfj"
      puts params[:title]
      if @gossip.update('user_id' => current_user.id,'title' => params[:title],'content' => params[:content])
        Gossip.order('id ASC')
        redirect_to "/gossips"
      else
        render :edit
      end
    end

    def destroy
      # Méthode qui récupère le potin concerné et le détruit en base
      @gossip = Gossip.find(id = params[:id].to_i)
      if @gossip.destroy
          @@num2="1"
      end
      redirect_to "/gossips"
    end
  end
