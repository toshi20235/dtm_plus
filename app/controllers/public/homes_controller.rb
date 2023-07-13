class Public::HomesController < ApplicationController
  def top
    @musics = Music.order(created_at: :desc).first(4)
  end
end
