
feature 'Viewing bookmarks' do
  scenario 'diplays a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com', 'course')")
    visit('/bookmarks')
    expect(page).to have_content 'course'
  end
end
