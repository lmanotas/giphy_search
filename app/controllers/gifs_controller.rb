class GifsController < ApplicationController
  def search
    @tags = search_params[:q]
    @gifs = Giphy::Search.new.search(@tags)
    render 'home/index'
  end

  def create
    Gif.create(gifs_params)
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