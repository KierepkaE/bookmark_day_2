require 'pg'

class Bookmarks
  def self.all
    setup
    result = connection.exec('SELECT * FROM bookmarks;')
    result.map { |bookmark| bookmark['url'] }
  end

  def self.add(url)
   setup
    connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
  end



private

def self.setup
  if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'bookmark_manager_test')
  else
    connection = PG.connect(dbname: 'bookmark_manager')
  end
end


end
