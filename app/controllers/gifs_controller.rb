class GifsController < ApplicationController
  before_action :authenticate_user!

  def index
    @gifs = current_user.gifs
  end

  def search
    @tags = search_params[:q]
    @gifs = Giphy::Search.new.search(@tags)
    render 'home/index'
  end

  def create
    Gif.create(
      gifs_params.merge({ user: current_user })
    )
    flash.now[:notice] = 'Gif saved on Database'
    render 'home/index'
  end

  private
  def search_params
    params.require(:search).permit(:q)
  end

  def gifs_params
    params.require(:gif).permit(:tags, :gif_api_id)
  end
end