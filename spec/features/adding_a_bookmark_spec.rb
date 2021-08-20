feature 'Adding a bookmark' do
    before(:each) do
        visit('/bookmark/add')
    end

    scenario 'A user wants to add a bookmark' do
        fill_in('url', with: 'https://www.marginalrevolution.com')
        fill_in('title', with: 'Marginal Revolution')
        click_on('Add Bookmark')
        expect(page).to have_content('Marginal Revolution')
    end
end