require 'rails_helper'

RSpec.describe "artists index page", type: :feature do
  it "can see all artists names" do

    visit "/artists"

    expect(page).to have_content(artist_1.name)
    expect(page).to have_content(artist_2.name)
  end
end