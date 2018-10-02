class AddReviewsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :comment
      t.integer :rating

      t.integer :user_id
      t.integer :book_id
      t.timestamps
    end
    add_index :reviews, :user_id, unique: true
    add_index :reviews, :book_id, unique: true
    end
  end
