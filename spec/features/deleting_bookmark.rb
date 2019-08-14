
feature 'viewing bookmarks' do

  scenario 'deleting a bookmark' do
    Bookmarks.add(url: 'http://www.makersacademy.com', title: 'Makers Academy')

    visit('/bookmarks')
    expect(page).to have_link("Makers Academy", href: 'http://www.makersacademy.com')

    first('.bookmark').click_button "delete"
    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link("Makers Academy", href: 'http://www.makersacademy.com')

  end
end