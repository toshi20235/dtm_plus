class Public::MusicsController < ApplicationController
  def new
    @music = Music.new
  end

  def index
  end

  def show
  end

  def create
    music = Music.new(music_params)
    music.save
    redirect_to users_my_page_path
  end

  def destroy
  end
  
  private
  
  def music_params
    params.require(:music).permit(:name, :explanation, :audio, :post_content, :image)
  end
  
end
