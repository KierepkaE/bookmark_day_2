
feature 'viewing bookmarks' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page). to have_content("Bookmark Manager")
  end
  scenario 'visiting the bookmarks page' do
    # Uses PG gem to connect to database
    connection = PG.connect(dbname: 'bookmark_manager_test')
    # Uses 'connection.exec' to add new links to database
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

    visit('/bookmarks')
    expect(page). to have_content("http://www.google.com")
    expect(page). to have_content("http://www.destroyallsoftware.com")
    expect(page). to have_content("http://www.makersacademy.com")
  end
end