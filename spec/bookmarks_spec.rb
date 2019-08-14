require_relative '../lib/bookmarks.rb'
describe Bookmarks do
  it 'shows list of bookmarks' do
    Bookmarks.add(url: "http://www.makersacademy.com")
  Bookmarks.add(url: "http://www.destroyallsoftware.com")
    Bookmarks.add(url: "http://www.google.com")

    expect(described_class.all).to include('http://www.google.com')
    expect(described_class.all).to include('http://www.makersacademy.com')
  end
  it 'creates a new bookmark' do
    Bookmarks.add(url: 'http://www.testbookmark.com')

    expect(Bookmarks.all).to include 'http://www.testbookmark.com'
  end
end
