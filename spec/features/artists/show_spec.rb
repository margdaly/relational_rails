require 'rails_helper'

RSpec.describe 'the artists show page' do
  describe 'artists show page' do 
    let!(:coyote) { Artist.create!(name: 'Criminal Coyote', sponsored: false, rank: 9) }
    let!(:graves) { Artist.create!(name: 'Mike Graves', sponsored: true, rank: 8) }
    let!(:mars) { Artist.create!(name: 'Farris Mars', sponsored: true, rank: 9) }

    it 'displays the artists name' do
      visit "/artists/#{coyote.id}"

      save_and_open_page
      expect(page).to have_content(coyote.name)
      expect(page).to_not have_content(graves.name)
    end

    # it 'displays if the artist is sponsored' do
    #   visit "/artists/#{artist.id}"

    # end

    # it 'displays the artists rank' do
    #   visit "/artists/#{artist.id}"

    # end
  end
end