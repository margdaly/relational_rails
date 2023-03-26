require 'rails_helper'

RSpec.describe 'the artists show page' do
  describe '/artists/:id' do 
    let!(:coyote) { Artist.create!(name: 'Criminal Coyote', sponsored: false, rank: 9) }
    let!(:graves) { Artist.create!(name: 'Mike Graves', sponsored: true, rank: 7) }
    let!(:mars) { Artist.create!(name: 'Farris Mars', sponsored: true, rank: 8) }
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
    let!(:lava_orange) { coyote.paints.create!(name: 'Lava Orange', 
                                               brand: 'MTN 94', 
                                               high_pressure: false, 
                                               opacity: 3) }
    let!(:black) { coyote.paints.create!(name: 'Black', 
                                         brand: 'Montana', 
                                         high_pressure: true, 
                                         opacity: 5) }
    
    it 'displays the artists name' do
      visit "/artists/#{coyote.id}"

      expect(page).to have_content(coyote.name)
      expect(page).to_not have_content(graves.name)
    end

    it 'displays if the artist is sponsored' do
      visit "/artists/#{graves.id}"

      expect(page).to have_content(graves.sponsored)
      expect(page).to_not have_content(coyote.sponsored)
    end

    it 'displays the artists rank' do
      visit "/artists/#{mars.id}"

      expect(page).to have_content("Rank: 8")
      expect(page).to_not have_content("Rank: 1")
    end

    it 'displays how much paint the artist has' do
      visit "/artists/#{graves.id}"

      expect(page).to have_content("Paint Count: 3")
      expect(page).to_not have_content("Paint Count: 4000")
    end

    it "displays link to take visitor to that artist's paint's page" do
      artist_paints = "Mike Graves's Paints"
      visit "/artists/#{graves.id}"

      click_on artist_paints

      expect(current_path).to eq("/artists/#{graves.id}/paints")
      expect(page).to have_content("Toffee")
      expect(page).to_not have_content("Black")
    end
  end
end