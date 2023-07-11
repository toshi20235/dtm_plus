class Public::MusicsController < ApplicationController
  
  def new
    @music = Music.new
  end

  def index
    
    @musics = Music.all
    
  end

  def show
    @music = Music.find(params[:id])
    @post = Music.find(params[:id])
    @comments = @post.comments  #投稿詳細に関連付けてあるコメントを全取得
    @comment = current_user.comments.new  #投稿詳細画面でコメントの投稿を行うので、formのパラメータ用にCommentオブジェクトを取得
  end
  

  def create
    music = Music.new(music_params)
    music.user_id = current_user.id
    music.save
    redirect_to users_my_page_path
    @posts = current_user.musics.new(music_params)
    if @posts.save
      redirect_back(fallback_location: root_path)  #コメント送信後は、一つ前のページへリダイレクトさせる。
    else
      redirect_back(fallback_location: root_path)  #同上
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
