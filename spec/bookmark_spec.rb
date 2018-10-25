require 'bookmark'

describe '.all' do
  it 'returns a list of bookmarks' do
    bookmark = Bookmark.create
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com')")
    expect(bookmark.all).to include "http://www.makersacademy.com"
  end

  it 'returns a list of bookmarks' do
    bookmarks = Bookmark.create
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.becka.com')")

    expect(bookmarks.all).to include "http://www.becka.com"
  end

  it 'adds a bookmark and can view it' do
    bookmark = Bookmark.create
    bookmark.add('www.edyta.com', 'edyta site')
    expect(bookmark.all).to include 'www.edyta.com'
  end
end

describe '#delete' do
  it 'deletes a bookmark from the list' do
    bookmark = Bookmark.create
    bookmark.add('www.edyta.com', 'edyta site')
    bookmark.delete('edyta site')
    expect(bookmark.all).not_to include('www.edyta.com')
  end
end
