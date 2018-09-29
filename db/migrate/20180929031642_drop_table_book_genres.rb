class DropTableBookGenres < ActiveRecord::Migration[5.2]
  def change
    drop_table :book_genres 
  end
end
