class User::RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.follow(params[:farmer_id])
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:farmer_id])
    redirect_to request.referer
  end

  def followings
    farmer = Farmer.find(params[:farmer_id])
    @farmers = user.followings
  end

  def followers
    farmer = Farmer.find(params[:farmer_id])
    @farmers = user.followers
  end
end
