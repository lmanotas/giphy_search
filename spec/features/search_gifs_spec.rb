require 'rails_helper'

feature 'Search for gifs', type: :feature do
  context 'from root page, search for gifs and see the results' do
    signed_user
    stub_search_request
    
    scenario do
      visit '/'
      fill_in 'search_gifs', with: 'funny cat'
      click_button 'Search'

      expect(page).to have_xpath("//ul/li[@id='FiGiRei2ICzzG']")
      expect(page).to have_content('Gifs with tag(s): funny cat')
    end
  end
end