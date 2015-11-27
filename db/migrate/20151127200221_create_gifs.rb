class CreateGifs < ActiveRecord::Migration
  def change
    create_table :gifs do |t|
      t.string  :tags
      t.string  :gif_api_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
