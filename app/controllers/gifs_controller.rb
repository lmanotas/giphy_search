class GifsController < ApplicationController
  def search
    @tags = search_params[:q]
    @gifs = Giphy::Search.new.search(@tags)
    render 'home/index'
  end

  private
  def search_params
    params.require(:search).permit(:q)
  end
end