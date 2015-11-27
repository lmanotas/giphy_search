require 'rails_helper'

feature 'Click on link to see saved gifs', type: :feature do
  signed_user
  stub_search_request

  scenario 'User has some saved gifs, should be in the list' do
    gif = create(:gif, user: user)

    visit '/gifs'

    expect(page).to have_xpath("//ul/li[@id='#{gif.gif_api_id}']")
  end
end