require 'rails_helper'

RSpec.describe 'Artist paints index' do
  let!(:coyote) { Artist.create!(name: 'Criminal Coyote', 
                                 sponsored: true, 
                                 rank: 8) }
  let!(:malachite) { coyote.paints.create!(name: 'Malachite', 
                                        brand: 'Molotow', 
                                        high_pressure: true, 
                                        opacity: 4) }
  let!(:lava_orange) { coyote.paints.create!(name: 'Lava Orange', 
                                        brand: 'MTN 94', 
                                        high_pressure: true, 
                                        opacity: 3) }
  let!(:black) { coyote.paints.create!(name: 'Black', 
                                       brand: 'Montana', 
                                       high_pressure: true, 
                                       opacity: 5) }
  
  it 'displays all the names of the paint for the artist' do
    visit "/artists/#{coyote.id}/paints"

    expect(page).to have_content(lava_orange.name)
    expect(page).to have_content(black.name)
    expect(page).to have_content(malachite.name)
  end

  it 'displays all the brands of the paint for the artist' do
    visit "/artists/#{coyote.id}/paints"

    expect(page).to have_content(lava_orange.brand)
    expect(page).to have_content(black.brand)
    expect(page).to have_content(malachite.brand)
  end

  it 'displays if all the paint is high_pressure or not for the artist' do
    visit "/artists/#{coyote.id}/paints"

    expect(page).to have_content(lava_orange.high_pressure)
    expect(page).to have_content(black.high_pressure)
    expect(page).to have_content(malachite.high_pressure)
  end

  it 'displays all the opacity of the paint for the artist' do
    visit "/artists/#{coyote.id}/paints"

    expect(page).to have_content(lava_orange.opacity)
    expect(page).to have_content(black.opacity)
    expect(page).to have_content(malachite.opacity)
  end

  it "links to artist's paints in alphabetical order by name" do
    visit "/artists/#{coyote.id}/paints"
  
    expect(malachite.name).to appear_before(lava_orange.name)
    expect(lava_orange.name).to appear_before(black.name)
    expect(black.name).to_not appear_before(malachite.name)

    click_link "Index Alphabetically"
    
    expect(current_path).to eq("/artists/#{coyote.id}/paints")
    expect(black.name).to appear_before(lava_orange.name)
    expect(lava_orange.name).to appear_before(malachite.name)
    expect(malachite.name).to_not appear_before(black.name)
  end
end 