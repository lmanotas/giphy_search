require 'rails_helper'

feature 'Save gifs from list', type: :feature do

   context 'seach for gifs and save favorites' do
    signed_user
    stub_search_request
    
    scenario do
      visit '/'
      fill_in 'search_gifs', with: 'funny cat'
      click_button 'Search'

      click_button 'Save Gif'
      expect(page).to have_content('Gif saved on Database')
    end  
  end

end
