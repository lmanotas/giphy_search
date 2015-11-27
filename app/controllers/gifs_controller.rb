class GifsController < ApplicationController
  def search
    @gifs = Giphy::Search.new.search(search_params[:q])
    render 'home/index'
  end

  private
  def search_params
    params.require(:search).permit(:q)
  end
end