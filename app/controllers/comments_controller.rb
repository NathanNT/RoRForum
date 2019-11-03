class CommentsController < ApplicationController



 def create
  @comment = Comment.create('user_id' => 1,'gossip_id' => params[:gossip_id],'content' => params[:content])
  puts "bongos"
  puts params[:gossip_id]
  puts params[:content]

  if @comment.save
    redirect_to "/gossips/#{params[:gossip_id]}"
  end
end


def edit
  @gossip = Gossip.new()
end

def update
      # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
      # pour info, le contenu de ce formulaire sera accessible dans le hash params
      # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
      @comment = Comment.find(id = params[:id].to_i)
      puts @comment
      puts "fjejfejfj"
      puts params[:title]
      if @comment.update('content' => params[:content])
        Gossip.order('id ASC')
        redirect_to gossip_path(params[:gossip_id])
      else
        render :edit
      end
    end

    def destroy
      # Méthode qui récupère le potin concerné et le détruit en base
      @comment = Comment.find(id = params[:id].to_i)
      if @comment.destroy
        redirect_to gossip_path(params[:gossip_id])
      end
      
    end
  end
