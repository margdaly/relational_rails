require 'rails_helper'

RSpec.describe 'the paints show page' do
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

  describe '/paints/:id' do
    it 'displays the paints name' do
      visit "/paints/#{toffee.id}"

      expect(page).to have_content(toffee.name)
      expect(page).to_not have_content(latte.name)
      expect(page).to_not have_content(hazelnut.name)
    end

    # it 'displays the paints brand'
    # it 'displays if the paint is high_pressure'
    # it 'displays the paints opacity'
    # it 'displays the paints artist'
  end
end