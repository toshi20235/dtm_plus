class Public::FavoritesController < ApplicationController
  def create
    @music = Favorite.new(user_id: current_user.id, music_id: params[:music_id])
    @music.save
    redirect_to music_path(params[:music_id]) 
  end

  def destroy
    @music = Favorite.find_by(user_id: current_user.id, music_id: params[:music_id])
    @music .destroy
    redirect_to music_path(params[:music_id]) 
  end
end
