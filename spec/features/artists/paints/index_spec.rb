require 'rails_helper'

RSpec.describe 'Artist paints index' do
  let!(:coyote) { Artist.create!(name: 'Criminal Coyote', 
                                 sponsored: true, 
                                 rank: 8) }
  let!(:lava_orange) { coyote.paints.create!(name: 'Lava Orange', 
                                        brand: 'MTN 94', 
                                        high_pressure: true, 
                                        opacity: 3) }
  let!(:black) { coyote.paints.create!(name: 'Black', 
                                       brand: 'Montana', 
                                       high_pressure: true, 
                                       opacity: 5) }
  let!(:malachite) { coyote.paints.create!(name: 'Malachite', 
                                          brand: 'Molotow', 
                                          high_pressure: true, 
                                          opacity: 4) }
  
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

  it "displays the artist's paints in alphabetical order by name" do
    visit "/artists/#{coyote.id}/paints"

    # expect(page).should 
  end
end 