require_relative '../lib/bookmarks.rb'
require_relative './database_helper.rb'

describe Bookmarks do
  it 'returns a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    bookmark = Bookmarks.add(url: "http://www.makersacademy.com", title: "Makers Academy")
    Bookmarks.add(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
    Bookmarks.add(url: "http://www.google.com", title: "Google")

    bookmarks = Bookmarks.all

    expect(bookmarks.length).to eq 3
    expect(bookmarks.first).to be_a Bookmarks
    expect(bookmarks.first.id).to eq bookmark.id
    expect(bookmarks.first.title).to eq 'Makers Academy'
    expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
   end

  describe '.create' do

      it 'creates a new bookmark' do
        bookmark = Bookmarks.add(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
        persisted_data = persisted_data(id: bookmark.id)

        expect(bookmark).to be_a Bookmarks
        expect(bookmark.title).to eq 'Test Bookmark'
        expect(bookmark.url).to eq 'http://www.testbookmark.com'
    end
end
describe '.delete' do
  it 'deletes the given bookmark' do
    bookmark = Bookmarks.add(title: 'Makers Academy', url: 'http://www.makersacademy.com')

    Bookmarks.delete(id: bookmark.id)

    expect(Bookmarks.all.length).to eq 0
  end
end

end
