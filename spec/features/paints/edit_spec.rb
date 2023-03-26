require 'rails_helper'

RSpec.describe 'Edit Paint' do
  describe 'update paint' do
    it 'links from paints show page to the edit page' do
      gamma = Artist.create!(name: 'Gamma', sponsored: false, rank: 7)
      melon = gamma.paints.create!(name: 'Melon', brand: "MTN 94", high_pressure: false, opacity: 3)

      visit "/paints/#{melon.id}"

      click_button "Update #{melon.name}"

      expect(current_path).to eq("/paints/#{melon.id}/edit")
    end

    it 'can edit the artist' do
      gamma = Artist.create!(name: 'Gamma', sponsored: false, rank: 7)
      melon = gamma.paints.create!(name: 'Melon', brand: "M 94", high_pressure: false, opacity: 3)
  
      visit "/paints/#{melon.id}"

      expect(page).to have_content('M 94')
  
      click_button 'Update Melon'
  
      fill_in 'Name', with: 'Melon'
      fill_in 'Brand', with: 'MTN 94'
      uncheck 'High pressure'
      fill_in 'Opacity', with: '3'

      click_button 'Update Paint'
  
      expect(current_path).to eq("/paints/#{melon.id}")
      expect(page).to have_content('MTN 94')
    end
  end
end