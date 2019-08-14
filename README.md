# Bookmark Manager

### Setting up the database

1. Connect to `psql` using the command line
2. Type `CREATE DATABASE bookmark_manager;`
3. To set up the appropriate tables, connect to the database in `psql` and run the SQL scripts in the 'db/migrations' folder in the given order.

### Running the Bookmark Manager App:

1. Type `rackup -p 3000` into the command line
2. To view bookmarks, type `localhost:3000/bookmarks` into your browser.