class Public::AlbumsController < ApplicationController
   before_action :authenticate_user!
  def index
    @albums = Album.where(user_id: current_user.id)
  end
  def create
    @music = Music.find(params[:music_id])
    album = @music.albums.new(user_id: current_user.id)
    if album.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
    @music = Music.find(params[:music_id])
    album = @music.albums.find_by(user_id: current_user.id)
    if album.present?
        album.destroy
        redirect_to request.referer
    else
        redirect_to request.referer
    end
  end
end

