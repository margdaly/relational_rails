require 'rails_helper'

RSpec.describe Paint, type: :feature do
  describe 'paints index page' do
    let!(:graves) { Artist.create!(name: 'Mike Graves', sponsored: true, rank: 8) }
    let!(:toffee) { graves.paints.create!(name: 'Toffee', 
                                  brand: 'Montana Gold', 
                                  high_pressure: false, 
                                  opacity: 3) }
    let!(:latte) { graves.paints.create!(name: 'Latte', 
                                 brand: 'Montana Gold', 
                                 high_pressure: false, 
                                 opacity: 4) }
    let!(:hazelnut) { graves.paints.create!(name: 'Hazelnut', 
                                    brand: 'Molotow', 
                                    high_pressure: true, 
                                    opacity: 5) }
  
    it 'displays all paints name' do
      visit "/paints"

      expect(page).to have_content(toffee.name)
      expect(page).to have_content(latte.name)
      expect(page).to have_content(hazelnut.name)
    end

    it 'displays all paints brand' do
      visit "/paints"

      expect(page).to have_content(toffee.brand)
      expect(page).to have_content(latte.brand)
      expect(page).to have_content(hazelnut.brand)
    end

    it 'displays if it is high pressure for all paints' do
      visit "/paints"

      expect(page).to have_content(toffee.high_pressure)
      expect(page).to have_content(latte.high_pressure)
      expect(page).to have_content(hazelnut.high_pressure)
    end
    it 'displays all paints opacity' do
      visit "/paints"

      expect(page).to have_content(toffee.opacity)
      expect(page).to have_content(latte.opacity)
      expect(page).to have_content(hazelnut.opacity)
    end

    it 'link at top of page takes visitor to paint index page' do
      paints = "Paints"
      visit "/artists"

      click_on paints

      expect(current_path).to eq("/paints")

      visit "/artists/#{graves.id}"

      click_on paints

      expect(current_path).to eq("/paints")

      visit "/artists/#{graves.id}/paints"

      click_on paints

      expect(current_path).to eq("/paints")
    end
  end
end