feature 'delete bookmark' do
  scenario 'I can delete a bookmark' do
    @bookmark = Bookmark.create
    visit '/bookmarks'
    @bookmark.add("www.bbc.co.uk", 'news')
    fill_in 'title', with: 'news'
    click_button 'delete'
    expect(page).to have_no_content('news')
  end
end
