class CommentlikeController < ApplicationController


 def create
    @like = Like.new('comment_id' => params[:comment_id],'user_id' => current_user.id)
    if @like.save
      redirect_to "/gossips/#{params[:gossip_id]}"
    end
 end

def destroy
if Like.where('comment_id' => params[:comment_id], 'user_id' => current_user.id).first.destroy
      redirect_to "/gossips/#{params[:gossip_id]}"
end
end

  end
