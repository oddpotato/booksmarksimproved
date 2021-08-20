require_relative '../../lib/bookmark'

describe Bookmark do
  describe '#self.all' do
    it "should return array of bookmark instances" do
      Bookmark.create('http://www.google.com', 'Google')
      expect([Bookmark.all[0].title, Bookmark.all[0].url]).to eq(['Google', 'http://www.google.com'])
    end
  end

  describe '#self.create' do
    it "should create a bookmark" do
      bookmark = Bookmark.create('http://www.google.com', 'Google')
      expect([bookmark.title, bookmark.url]).to eq(['http://www.google.com', 'Google'])
    end
  end

  describe '#self.delete' do
    # it "should delete a bookmark" do
    #   Bookmark.create('http://www.google.com', 'Google')
    # end
  end
end
