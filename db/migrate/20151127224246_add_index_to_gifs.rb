class AddIndexToGifs < ActiveRecord::Migration
  def change
    add_index :gifs, :gif_api_id
  end
end
