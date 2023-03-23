require 'rails_helper'

RSpec.describe '/artists', type: :feature do
  describe 'artists index page' do 
    let!(:coyote) { Artist.create!(name: 'Criminal Coyote', sponsored: false, rank: 9) }
    let!(:graves) { Artist.create!(name: 'Mike Graves', sponsored: true, rank: 8) }
    let!(:mars) { Artist.create!(name: 'Farris Mars', sponsored: true, rank: 9) }

    it 'can see each name of all artists' do
      visit "/artists"
      # save_and_open_page
      expect(page).to have_content(coyote.name)
      expect(page).to have_content(graves.name)
      expect(page).to have_content(mars.name)
    end
  end
end