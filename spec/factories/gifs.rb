FactoryGirl.define do
  factory :gif do    
    sequence(:gif_api_id) { |n| "#{n}-somehashhere" }
    tags 'cats dogs fight'
    url  'http://45.media.tumblr.com/7e41f7f776926317ebb39ac1a60b8361/tumblr_mx5q9u7wAs1qellyvo1_400.gif'
  end
end