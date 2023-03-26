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
      gamma = Artist.create!(name: 'Gamm', sponsored: false, rank: 7)
  
      visit "/artists/#{gamma.id}"

      expect(page).to have_content('Gamm')
  
      click_button 'Update Gamm'
  
      fill_in 'Name', with: 'Gamma'

      expect(page).to have_field(:sponsored)
      expect(page).to have_field(:rank)

      click_button 'Update Artist'
  
      expect(current_path).to eq("/artists/#{gamma.id}")
      expect(page).to have_content('Gamma')
    end
  end
end