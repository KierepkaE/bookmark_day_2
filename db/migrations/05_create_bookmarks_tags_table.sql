CREATE TABLE bookmarks_tags
(
  tag_id INTEGER REFERENCES tags (id),
  bookmark_id INTEGER REFERENCES bookmarks (id)
);