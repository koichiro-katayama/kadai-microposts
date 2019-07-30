class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    # favorites_path, method: :post
    micropost = Micropost.find(params[:micropost_id])
    # favorite = Favorite.new # (user_id: current_user.id, micropost_id: params[:micropost_id])
    # favorite.user_id = current_user.id
    # favorite.micropost_id = params[:micropost_id]
    # favorite.save
    current_user.like(micropost)
    redirect_back(fallback_location: root_url)
    # @micropost = Micropost.find(params[:micropost_id])
    # @micropost.like(current_user)
  end
  
  # def updata
      # favorite_path(favoriteクラスのインスタンス), method: :put
      # favorite_path(favoriteクラスのインスタンス), method: :patch
  # end

  def destroy
    # favorite_path(favoriteクラスのインスタンス), method: :delete
    micropost = Micropost.find(params[:micropost_id])
    current_user.unlike(micropost)
    redirect_back(fallback_location: root_url)
    # @micropost = Favorites.find(params[:id]).micropost
    # @micropost.deslike(current_user)
  end
end
