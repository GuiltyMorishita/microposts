class FavoritesController < ApplicationController
   before_action :logged_in_user

  def create
    #binding.pry
    @micropost = Micropost.find(params[:micropost_id])
    current_user.favorite(@micropost)
    redirect_to root_path
  end

  def destroy
    #@micropost = current_user.user_favorites.find(params[:id]).micropost
    @micropost = Micropost.find(params[:id])
    current_user.unfavorite(@micropost)
    redirect_to request.referrer || root_url
  end
end
