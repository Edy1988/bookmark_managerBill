require 'bookmark'

describe '.all' do
  it 'returns a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com')")
    bookmarks = Bookmark.all

    expect(bookmarks).to include "http://www.makersacademy.com"
  end

  it 'returns a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.becka.com')")
    bookmarks = Bookmark.all

    expect(bookmarks).to include "http://www.becka.com"
  end
end
