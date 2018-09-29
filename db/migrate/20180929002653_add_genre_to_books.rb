class AddGenreToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :genres, :integer, default: nil 
  end
end
