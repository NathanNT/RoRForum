class CommentlikeController < ApplicationController


 def create
    @like = Like.new('comment_id' => params[:comment_id])
    if @like.save
      redirect_to "/gossips/#{params[:gossip_id]}"
    end
 end


  end
