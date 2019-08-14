
feature 'viewing bookmarks' do

  scenario 'adding new bookmark' do
    # Uses PG gem to connect to database
    connection = PG.connect(dbname: 'bookmark_manager_test')
    visit('/bookmarks')
    fill_in "url", with: 'http://www.testbookmark.com'
    fill_in "title", with: 'Test Bookmark'
    click_button("add")
    expect(page).to have_link('Test Bookmark', href: 'http://www.testbookmark.com')
  end
end