require 'rails_helper'

RSpec.describe 'Artists paints index' do
  let!(:coyote) { Artist.create!(name: 'Mike coyote', 
                                 sponsored: true, 
                                 rank: 8) }
  let!(:lava_orange) { coyote.paints.create!(name: 'Lava Orange', 
                                        brand: 'MTN 94', 
                                        high_pressure: false, 
                                        opacity: 3) }
  let!(:black) { coyote.paints.create!(name: 'Black', 
                                       brand: 'Montana', 
                                       high_pressure: true, 
                                       opacity: 5) }
  let!(:malachite) { coyote.paints.create!(name: 'Malachite', 
                                          brand: 'Molotow', 
                                          high_pressure: false, 
                                          opacity: 4) }
  
  it 'displays all the names of the paint for the artist' do
    visit "/artists/#{coyote.id}/paints"

    save_and_open_page
    expect(page).to have_content(lava_orange.name)
    expect(page).to have_content(black.name)
    expect(page).to have_content(malachite.name)
  end
end