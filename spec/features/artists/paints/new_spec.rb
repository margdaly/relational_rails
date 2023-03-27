require 'rails_helper'

RSpec.describe 'New Artist Paint' do
  describe 'Artist Paint Creation' do
    it "links to new page from artist's paint index page" do
      charney = Artist.create!(name: 'Anna Charney', sponsored: false, rank: 8)
      visit "/artists/#{charney.id}/paints"
      
      click_on('Create Paint')

      expect(current_path).to eq("/artists/#{charney.id}/paints/new")
      expect(page).to have_content("New Paint Form")
    end

    it 'can create a new Artist Paint' do
      charney = Artist.create!(name: 'Anna Charney', sponsored: false, rank: 8)
      visit "/artists/#{charney.id}/paints"
      
      expect(page).to_not have_content("Mt. Fuji")
      
      click_on('Create Paint')
      
      fill_in 'Name', with: 'Mt. Fuji'
      fill_in 'Brand', with: 'Montana'
      select(true, from: 'High pressure')
      fill_in 'Opacity', with: '4'

      click_button('Create Paint')

      expect(current_path).to eq("/artists/#{charney.id}/paints")
      expect(page).to have_content('Mt. Fuji')
    end
  end
end