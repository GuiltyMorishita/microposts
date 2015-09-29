class FavoritesController < ApplicationController
   before_action :logged_in_user

  def create
    @micropost = Micropost.find(params[:favorited_id])
    current_user.favorite(@micropost)
  end

  def destroy
    @micropost = current_user.favoritings.find(params[:id]).favorited
    current_user.unfavorite(@micropost)
  end
end
