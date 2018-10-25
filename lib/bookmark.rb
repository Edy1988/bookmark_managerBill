require 'pg'

class Bookmark

  def self.create
    @bookmark || Bookmark.new
  end

  def all
    connection = connect_to_database
    result = connection.exec("SELECT * FROM bookmarks;")
    result.map { |bookmark| bookmark['url'] }
  end

  def add(url, title)
    connection = connect_to_database
    connection.exec("INSERT INTO bookmarks(url,title)VALUES('#{url}','#{title}')")
  end

  def delete(title)
    connection = connect_to_database
    connection.exec("DELETE FROM bookmarks WHERE title='#{title}'")
  end

  def view_titles
    connection = connect_to_database
    result = connection.exec("SELECT * FROM bookmarks;")
    result.map { |bookmark| bookmark['title'] }
  end

  private

  def connect_to_database
    if ENV['RACK_ENV'] == 'test'
      PG.connect :dbname => "bookmark_manager_test"
    else
      PG.connect :dbname => "bookmark_manager"
    end
  end

end
