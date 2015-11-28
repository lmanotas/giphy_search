class Gif < ActiveRecord::Base
  belongs_to :user

  validates :url, presence: true
  validates :gif_api_id, uniqueness: true

end
