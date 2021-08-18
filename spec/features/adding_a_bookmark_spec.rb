feature 'Adding a bookmark' do
    before(:each) do
        visit('/add-bookmark')
    end

    scenario 'A user wants to add a bookmark' do
        fill_in('Add Bookmark', with: 'https://www.marginalrevolution.com')
        click('Add Bookmark')
        expect(page).to have_content('https://www.marginalrevolution.com')
    end
end