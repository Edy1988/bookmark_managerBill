require 'bookmark'

describe Bookmark do
  it 'initializes with a name' do
    bookmark = Bookmark.new("Bookmark 1")
    expect(bookmark.name).to eq "Bookmark 1"
  end

  describe '#self.all' do
    it "displays all bookmarks" do
      expect(Bookmark.all).to include ("http://www.makersacademy.com")
      expect(Bookmark.all).to include ("http://www.destroyallsoftware.com")
      expect(Bookmark.all).to include ("http://www.google.com")
    end
  end
end
