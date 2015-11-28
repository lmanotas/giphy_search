class Gif < ActiveRecord::Base
  belongs_to :user

  validates :url, presence: true
  validates :gif_api_id, uniqueness: true

  # Stores the info from the API, when :complete_info method is used
  attr_accessor :info
  # Recovers all the gif info from the API
  def complete_info
    @info = Giphy::Gifs.new.get(gif_api_id)
  end
end
