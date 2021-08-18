feature 'Index page' do
    before(:each) do
        visit('/')
    end

    it "expects the page to have title" do
      expect(page).to have_content 'Bookmark Manager'
    end

    it 'has a link to view bookmarks' do
        expect(page).to have_selector(:link_or_button, 'View Bookmarks')
    end

    it 'has a link to add bookmarks' do
        expect(page).to have_selector(:link_or_button, 'Add Bookmarks')
    end
    
  end
  
