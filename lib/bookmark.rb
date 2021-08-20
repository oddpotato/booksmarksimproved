require 'pg'

class Bookmark

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      @connection = PG.connect(dbname: 'bookmark_manager')
    end
    @bookmarks = @connection.exec('SELECT * FROM bookmarks')
    
  end

  def self.create(url:, title:)
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      @connection = PG.connect(dbname: 'bookmark_manager')
   end
    @connection.exec_params("INSERT INTO bookmarks (url, title) VALUES ($1, $2);", [url, title])
  end
end


