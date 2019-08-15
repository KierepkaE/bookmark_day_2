require_relative '../lib/bookmarks.rb'
require_relative './database_helper.rb'
require 'comment'


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
    it 'does not create a new bookmark if the URL is not valid' do
      Bookmarks.add(url: 'not a real bookmark', title: 'not a real bookmark')
      expect(Bookmarks.all).not_to include 'not a real bookmark'
    end
  end

    describe '.create' do
      it 'creates a new comment' do
        bookmark = Bookmarks.add(url: "http://www.makersacademy.com", title: "Makers Academy")
        comment = Comment.create(text: 'This is a test comment', bookmark_id: bookmark.id)

        persisted_data = persisted_data(table: 'comments', id: comment.id )

        expect(comment).to be_a Comment
        expect(comment.id).to eq persisted_data.first['id']
        expect(comment.text).to eq 'This is a test comment'
        expect(comment.bookmark_id).to eq bookmark.id
      end
end
describe '.delete' do
  it 'deletes the given bookmark' do
    bookmark = Bookmarks.add(title: 'Makers Academy', url: 'http://www.makersacademy.com')

    Bookmarks.delete(id: bookmark.id)

    expect(Bookmarks.all.length).to eq 0
  end
end

it 'updates the bookmark with the given data' do
  bookmark = Bookmarks.add(title: 'Makers Academy', url: 'http://www.makersacademy.com')
  updated_bookmark = Bookmarks.update(id: bookmark.id, url: 'http://www.snakersacademy.com', title: 'Snakers Academy')

  expect(updated_bookmark).to be_a Bookmarks
  expect(updated_bookmark.id).to eq bookmark.id
  expect(updated_bookmark.title).to eq 'Snakers Academy'
  expect(updated_bookmark.url).to eq 'http://www.snakersacademy.com'
end

describe '.find' do
  it 'returns the requested bookmark object' do
    bookmark = Bookmarks.add(title: 'Makers Academy', url: 'http://www.makersacademy.com')

    result = Bookmarks.find(id: bookmark.id)

    expect(result).to be_a Bookmarks
    expect(result.id).to eq bookmark.id
    expect(result.title).to eq 'Makers Academy'
    expect(result.url).to eq 'http://www.makersacademy.com'
  end
end


describe '#comments' do
  let(:comment_class) { double(:comment_class) }
  it 'calls .where on the Comment class' do
    bookmark = Bookmarks.add(title: 'Makers Academy', url: 'http://www.makersacademy.com')
    expect(comment_class).to receive(:where).with(bookmark_id: bookmark.id)

    bookmark.comments(comment_class)
  end

end

end

