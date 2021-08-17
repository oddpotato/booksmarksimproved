feature 'Index page' do
  scenario "expects the page to have title" do
    visit('/')
    expect(page).to have_content 'Bookmark Manager'
  end
  scenario "viewing bookmark page" do
    visit('/bookmarks')
    expect(page).to have_content "https://www.makersacademy.com"
  end
end
