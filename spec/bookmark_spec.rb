require 'bookmark'

describe Bookmark do
  it 'initializes with a name' do
    bookmark = Bookmark.new("Bookmark 1")
    expect(bookmark.name).to eq "Bookmark 1"
  end
end
