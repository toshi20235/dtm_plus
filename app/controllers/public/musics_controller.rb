class Public::MusicsController < ApplicationController
  
  def new
    @music = Music.new
  end

  def index
    @musics = Music.all.order('id DESC')
    @music_favorites = Music.includes(:favorit_users).sort {|a,b| b.favorit_users.size <=> a.favorit_users.size}
  end

  def show
    @music = Music.find(params[:id])
    @comments = @music.comments
    @comment = current_user.comments.new
  end
  

  def create
    music = Music.new(music_params)
    music.user_id = current_user.id
    music.save
    redirect_to user_path(current_user)
  end

  def destroy
    music = Music.find(params[:id])
    music.destroy
    redirect_to user_path(current_user)
  end
  
  private
  
  def music_params
    params.require(:music).permit(:name, :explanation, :audio, :post_content, :image)
  end
  
end
