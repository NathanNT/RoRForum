class CommentsController < ApplicationController


  def create
    @like = Like.new('comment_id' => current_user.id,'gossip_id' => params[:gossip_id])
    if @like.save
      redirect_to "/gossips"
    end
  end


  end
