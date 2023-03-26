require 'rails_helper'

RSpec.describe 'New Artist' do
  describe 'Artist Creation' do
    it 'links to new page from artists index page' do
      visit '/artists'

      expect(page).to_not have_content("Gamma")
      
      click_link('New Artist')

      expect(current_path).to eq('/artists/new')
      expect(page).to have_content("New Artist Form")
      expect(page).to have_field(:name)
      expect(page).to have_field(:sponsored)
      expect(page).to have_field(:rank)
      expect(page).to have_button("Create Artist")
    end

    it 'can create a new Artist' do
      visit '/artists/new'

      fill_in 'Name', with: 'Gamma'
      uncheck 'Sponsored'
      fill_in 'Rank', with: '8'

      click_button('Create Artist')

      expect(current_path).to eq("/artists")
      expect(page).to have_content('Gamma')
    end
  end
end