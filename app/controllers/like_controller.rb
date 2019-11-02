class LikeController < ApplicationController


 def create
    @like = Like.new('gossip_id' => params[:gossip_id])
    if @like.save
      redirect_to "/gossips"
    end
 end


  end
