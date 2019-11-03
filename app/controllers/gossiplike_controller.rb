class GossiplikeController < ApplicationController


 def create
    @like = Like.new('gossip_id' => params[:gossip_id], 'user_id' => current_user.id)
    if @like.save
      redirect_to "/gossips/#{params[:gossip_id]}"
    end

 end
def destroy
if Like.where('gossip_id' => params[:gossip_id], 'user_id' => current_user.id).first.destroy
      redirect_to "/gossips/#{params[:gossip_id]}"
end
end

end
