require 'rails_helper'

feature 'Search for gifs' do
  context 'from root page, search for gifs and see the results' do
    stub_search_request
    
    it do
      visit '/'
      fill_in 'search_gifs', with: 'funny cat'
      click_button 'Search'

      expect(page).to have_content('FiGiRei2ICzzG')
    end
  end
end