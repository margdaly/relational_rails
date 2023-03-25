require 'rails_helper'

RSpec.describe 'the paints show page' do
  let!(:graves) { Artist.create!(name: 'Mike Graves', sponsored: true, rank: 8) }
  let!(:toffee) { graves.paints.create!(name: 'Toffee', 
                                brand: 'Montana', 
                                high_pressure: false, 
                                opacity: 3) }
  let!(:latte) { graves.paints.create!(name: 'Latte', 
                               brand: 'Montana', 
                               high_pressure: false, 
                               opacity: 4) }
  let!(:hazelnut) { graves.paints.create!(name: 'Hazelnut', 
                                  brand: 'Molotow', 
                                  high_pressure: true, 
                                  opacity: 5) }

  describe '/paints/:id' do
    it 'displays the paints name' do
      visit "/paints/#{toffee.id}"

      expect(page).to have_content(toffee.name)
      expect(page).to_not have_content(latte.name)
      expect(page).to_not have_content(hazelnut.name)
    end

    it 'displays the paints brand' do
      visit "/paints/#{latte.id}"

      expect(page).to have_content(latte.brand)
      expect(page).to have_content(toffee.brand)
      expect(page).to_not have_content(hazelnut.brand)
    end

    it 'displays if the paint is high_pressure' do
      visit "/paints/#{hazelnut.id}"

      expect(page).to have_content(hazelnut.high_pressure)
      expect(page).to_not have_content(latte.high_pressure)
      expect(page).to_not have_content(toffee.high_pressure)
    end

    it 'displays the paints opacity' do
      visit "/paints/#{hazelnut.id}"

      expect(page).to have_content(hazelnut.opacity)
      expect(page).to_not have_content(latte.opacity)
      expect(page).to_not have_content(toffee.opacity)
    end
  end
end