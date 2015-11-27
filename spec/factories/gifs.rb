FactoryGirl.define do
  factory :gif do    
    sequence(:gif_api_id) { |n| "#{n}-somehashhere" }
    tags 'cats dogs fight'
  end
end