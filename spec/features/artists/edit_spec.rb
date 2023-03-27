require 'rails_helper'

RSpec.describe 'Edit Artist' do
  describe 'update artist' do
    it 'links to the edit page' do
      gamma = Artist.create!(name: 'Gamma', sponsored: false, rank: 7)
      
      visit "/artists/#{gamma.id}"
      
      click_button "Update #{gamma.name}" 

      expect(current_path).to eq("/artists/#{gamma.id}/edit")
    end

    it 'can edit the artist' do
      gamma = Artist.create!(name: 'Gamm', sponsored: true, rank: 7)
  
      visit "/artists/#{gamma.id}"

      expect(page).to have_content('Gamm')
      
      click_button 'Update Gamm'

      fill_in 'Name', with: 'Gamma'
      select(false, from: 'Sponsored')
      fill_in 'Rank', with: '7'

      click_button 'Update Artist'
  
      expect(current_path).to eq("/artists/#{gamma.id}")
      expect(page).to have_content('Gamma')
      expect(page).to have_content("false")
      expect(page).to have_content("7")
    end
  end
end