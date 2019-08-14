# BOOKMARK MANAGER

### user story:

`As a user,`
`So that I can quickly revisit my favourite websites,`
`I want to see list of bookmarks`

### domain model

USER ==> Bookmars ==> Display on the website

### setting up database:

- connect to psql `psql`
- create database using command `CREATE DATABASE bookmark_manager;`
- connect to the database with command `\c bookmark_manager;`
- run the query from `db/migarations/01_create_bookmark_manager`

### setting up test database:

- connect to psql `psql`
- create database using command `CREATE DATABASE bookmark_manager_test;`
- connect to the database with command `\c bookmark_manager_test;`
- run the query from `db/migarations/02_create_bookmark_manager_test`
