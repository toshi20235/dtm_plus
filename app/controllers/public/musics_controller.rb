class Public::MusicsController < ApplicationController
  
  def new
    @music = Music.new
  end

  def index
    
    @musics = Music.all
    
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
    # redirect_to users_my_page_path
    
    @post = current_user.music.new(music_params)
    if @post.save
      redirect_to users_my_page_path
    else
      render :new
    end
  end

  def destroy
    music = Music.find(params[:id])
    music.destroy
    redirect_to users_my_page_path
  end
  
  private
  
  def music_params
    params.require(:music).permit(:name, :explanation, :audio, :post_content, :image)
  end
  
end
