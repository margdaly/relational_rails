require 'rails_helper'

RSpec.describe 'New Artist' do
  describe 'Artist Creation' do
    it 'links to new page from artists index page' do
      visit '/artists'

      click_link ('New Artist')

      expect(current_path).to eq('/artists/new')
    end
  end
end
# fill_in 'Name', with: 'Anna Charney'
# click_on 'Create Artist'

# expect(current_path).to eq("/artists")
# expect(page).to have_content('Anna Charney')

  # expect(page).to have_content("New Artist Form")
  # expect(page).to have_field(:name)
  # expect(page).to have_field(:sponsored)
  # expect(page).to have_field(:rank)
  # expect(page).to have_button("Create Artist")