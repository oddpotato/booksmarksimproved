feature 'Deleting a bookmark' do
  before(:each) do
    visit('/bookmark/add')
    fill_in('url', with: 'https://www.marginalrevolution.com')
    fill_in('title', with: 'Marginal Revolution')
    click_on('Add Bookmark')
    expect(page).to have_content('Marginal Revolution')
    visit('/bookmark/delete')
  end

  scenario 'A user wants to delete a bookmark' do
      fill_in('id', with: 1 )
      click_on('Delete Bookmark')
      expect(page).not_to have_content('Marginal Revolution')
  end
end