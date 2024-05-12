class AddFulltextIndexToBooks < ActiveRecord::Migration[7.1]
  def up
    execute("ALTER TABLE books ADD FULLTEXT INDEX `index_books_on_fulltext` (`title`, `content`) WITH PARSER ngram")
  end

  def down
    execute("ALTER TABLE books DROP INDEX `index_books_on_fulltext`")
  end
end
