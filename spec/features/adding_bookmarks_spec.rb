
feature 'viewing bookmarks' do

  scenario 'adding new bookmark' do
    # Uses PG gem to connect to database
    connection = PG.connect(dbname: 'bookmark_manager_test')
    visit('/bookmarks')
    fill_in "url", with:("http://www.makersacademy.com")
    click_button("add")
    expect(page).to have_content("http://www.makersacademy.com")
  end
end