require 'pg'

class Bookmark

  def self.create
    @bookmark || Bookmark.new
  end

  def self.all
    connection = self.connect_to_database
    result = connection.exec("SELECT * FROM bookmarks;")
    result.map { |bookmark| bookmark['url'] }
  end

  def add(url, title)
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect :dbname => "bookmark_manager_test"
    else
      con = PG.connect :dbname => "bookmark_manager"
    end
    con.exec("INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}') ")
  end


  def self.connect_to_database
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect :dbname => "bookmark_manager_test"
    else
      con = PG.connect :dbname => "bookmark_manager"
    end
  end

  def self.view_titles
    connection = self.connect_to_database
    result = connection.exec("SELECT * FROM bookmarks;")
    result.map { |bookmark| bookmark['title'] }
  end

end
