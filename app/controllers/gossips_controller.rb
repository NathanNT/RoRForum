class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:index,:new,:create]
  layout "application", except: [:new, :create]

  def index

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
    @gossip = Gossip.new('user_id' => current_user.id,'title' => params[:title],'content' => params[:content])

    if @gossip.save
      redirect_to "/gossips"
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

      if @gossip.user_id == current_user.id
        if @gossip.update('user_id' => current_user.id,'title' => params[:title],'content' => params[:content])
          Gossip.order('id ASC')
          redirect_to "/gossips"
        else
          redirect_to "/gossips"
        end
      end
    end

    def destroy
      # Méthode qui récupère le potin concerné et le détruit en base
      @gossip = Gossip.find(id = params[:id].to_i)

      puts @gossip.user_id 
      puts current_user.id

      if @gossip.user_id == current_user.id

        @gossip.destroy
        redirect_to "/gossips"
        @@num2="1"
      else
        redirect_to "/gossips"
      end


    end


    private

    def authenticate_user
      unless current_user
        flash[:danger] = "Please log in."
        redirect_to new_session_path
      end
    end

  end
