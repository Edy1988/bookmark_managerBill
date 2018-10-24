feature 'adding bookmarks' do
  scenario 'user can add bookmark from browser and get confirmation' do
    visit '/add_bookmarks'
    fill_in 'url', with: 'www.tfl.gov.uk'
    click_on('add')
    expect(page).to have_content('Bookmark added')
  end

  scenario 'user can add bookmark from browser and view on bookmarks page' do
    visit '/add_bookmarks'
    fill_in 'url', with: 'www.tfl.gov.uk'
    click_on('add')
    click_on('View all')
    expect(page).to have_content('www.tfl.gov.uk')
  end
end
