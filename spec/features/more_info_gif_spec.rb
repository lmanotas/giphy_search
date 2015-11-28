require 'rails_helper'

feature 'Show more info from API', type: :feature do

   context 'More info link' do
    signed_user
    stub_gifs_request
    
    scenario do
      create(:gif, user: user)

      visit '/gifs'
      click_link 'More Info'

      expect(page).to have_content('bitly_gif_url')
      expect(page).to have_content('http://gph.is/XJ200y')
    end
  end

end