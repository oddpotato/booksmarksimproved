require 'pg'

class Bookmark
  def self.all
    @connection = PG.connect(dbname: 'bookmark_manager')
    @bookmarks = @connection.exec('SELECT * FROM bookmarks')
    @list = @bookmarks.map { |bookmark| bookmark['url'] }
  end
end
