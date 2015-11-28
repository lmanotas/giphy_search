class GifsController < ApplicationController
  before_action :authenticate_user!

  def index
    @gifs = current_user.gifs
  end

  def search
    @tags = params[:q]
    @gifs = Giphy::Search.new.search(@tags)
    render 'home/index'
  end

  def create
    gif = Gif.create(create_gifs_params)
    if gif.persisted?
      flash.now[:notice] = 'Gif saved on Database'
    end
    render 'home/index'
  end

  private
  def create_gifs_params
    params.require(:gif).permit(:tags, :gif_api_id, :url).merge({ user: current_user })
  end
end