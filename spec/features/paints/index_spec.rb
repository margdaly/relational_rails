require 'rails_helper'

RSpec.describe Paint, type: :feature do
  describe 'paints index page' do
    let!(:graves) { Artist.create!(name: 'Mike Graves', sponsored: true, rank: 8) }
    let!(:toffee) { graves.paints.create!(name: 'Toffee', 
                                  brand: 'MTN 94', 
                                  high_pressure: false, 
                                  opacity: 3) }
    let!(:latte) { graves.paints.create!(name: 'Latte', 
                                 brand: 'Montana', 
                                 high_pressure: true, 
                                 opacity: 4) }
    let!(:hazelnut) { graves.paints.create!(name: 'Hazelnut', 
                                    brand: 'Molotow', 
                                    high_pressure: true, 
                                    opacity: 5) }
  
    it 'only displays paints that are high pressured' do
      visit "/paints"

      expect(page).to_not have_content(toffee.name)
      expect(page).to have_content(latte.name)
      expect(page).to have_content(hazelnut.name)
    end
    
    it 'displays paints name' do
      visit "/paints"

      expect(page).to_not have_content(toffee.name)
      expect(page).to have_content(latte.name)
      expect(page).to have_content(hazelnut.name)
    end

    it 'displays paints brand' do
      visit "/paints"

      expect(page).to_not have_content(toffee.brand)
      expect(page).to have_content(latte.brand)
      expect(page).to have_content(hazelnut.brand)
    end

    it 'displays true for if paint is high pressured' do
      visit "/paints"

      expect(page).to_not have_content(toffee.high_pressure)
      expect(page).to have_content(latte.high_pressure)
      expect(page).to have_content(hazelnut.high_pressure)
    end
    it 'displays paints opacity' do
      visit "/paints"

      expect(page).to_not have_content(toffee.opacity)
      expect(page).to have_content(latte.opacity)
      expect(page).to have_content(hazelnut.opacity)
    end

    it 'has link at top of any page takes visitor to paint index page' do
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

    it 'has links to edit paints info' do
      visit "/paints"

      click_on("Update #{latte.name}")

      expect(current_path).to eq("/paints/#{latte.id}/edit")
      expect(page).to have_content("Update #{latte.name} Form")
    end

    it "has link to delete paint" do
      visit "/paints"

      click_button("Delete #{hazelnut.name}")

      expect(current_path).to eq("/paints")
      expect(page).to_not have_content("#{hazelnut.name}")
    end
  end
end