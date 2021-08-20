require 'pg'

class Bookmark
  attr_reader :id, :title, :url

  def initialize(id, title, url)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      @connection = PG.connect(dbname: 'bookmark_manager')
    end
    result = @connection.exec('SELECT * FROM bookmarks')
    @bookmarks = result.map { |bookmark| Bookmark.new(bookmark['id'], bookmark['title'], bookmark['url']) }
  end

  def self.create(url, title)
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      @connection = PG.connect(dbname: 'bookmark_manager')
   end
    result = @connection.exec_params("INSERT INTO bookmarks (url, title) VALUES ($1, $2) RETURNING id, title, url;", [url, title])
    Bookmark.new(result[0]['id'], url, title)
  end
end


