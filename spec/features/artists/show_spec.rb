require 'rails_helper'

RSpec.describe 'the artists show page' do
  describe 'artists show page' do 
    let!(:coyote) { Artist.create!(name: 'Criminal Coyote', sponsored: false, rank: 9) }
    let!(:graves) { Artist.create!(name: 'Mike Graves', sponsored: true, rank: 7) }
    let!(:mars) { Artist.create!(name: 'Farris Mars', sponsored: true, rank: 8) }

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

      expect(page).to have_content(mars.rank)
      expect(page).to_not have_content(coyote.rank)
    end
  end
end