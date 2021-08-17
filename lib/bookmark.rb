require 'pg'

class Bookmark
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      @connection = PG.connect(dbname: 'bookmark_manager')
    end
    @bookmarks = @connection.exec('SELECT * FROM bookmarks')
    @list = @bookmarks.map { |bookmark| bookmark['url'] }
  end
end
