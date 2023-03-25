require 'rails_helper'

RSpec.describe '/artists', type: :feature do
  describe 'artists index page' do 
    let!(:coyote) { Artist.create!(name: 'Criminal Coyote', sponsored: false, rank: 9, created_at: 'Fri, 24 Mar 2023 03:28:02 UTC +00:00') }
    let!(:graves) { Artist.create!(name: 'Mike Graves', sponsored: true, rank: 8, created_at: 'Sat, 25 Mar 2023 03:28:02 UTC +00:00') }
    let!(:mars) { Artist.create!(name: 'Farris Mars', sponsored: true, rank: 9, created_at: 'Sun, 26 Mar 2023 03:28:02 UTC +00:00') }

    it 'can see each name of all artists' do
      visit "/artists"
      
      expect(page).to have_content(coyote.name)
      expect(page).to have_content(graves.name)
      expect(page).to have_content(mars.name)
    end

    it 'displays artists with most recently created first' do
      visit "/artists"
      save_and_open_page

      expect(coyote.name).to appear_before(graves.name)
      expect(graves.name).to appear_before(mars.name)
      expect(mars.name).to_not appear_before(coyote.name)
    end
  end
end