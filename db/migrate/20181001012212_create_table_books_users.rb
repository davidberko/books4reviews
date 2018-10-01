class CreateTableBooksUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :books_users do |t|

      t.integer :user_id
      t.integer :book_id
    end
    add_index :books_users, [:user_id, :book_id], unique: true 
  end
end
