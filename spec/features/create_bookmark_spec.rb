feature 'adding bookmarks' do
  scenario 'user can add bookmark from browser and get confirmation' do
    visit '/add_bookmarks'
    fill_in 'url', with: 'www.tfl.gov.uk'
    fill_in 'title', with: 'transport for london'
    click_on('add')
    expect(page).to have_content('Bookmark added')
  end

  scenario 'user can add bookmark from browser and view on bookmarks page' do
    visit '/add_bookmarks'
    fill_in 'url', with: 'www.tfl.gov.uk'
    fill_in 'title', with: 'transport for london'
    click_on('add')
    click_on('View all')
    expect(page).to have_content('transport for london')
  end


end
