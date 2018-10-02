class ChangeIndexesOnReviews < ActiveRecord::Migration[5.2]
  def change
    remove_index :reviews, :user_id
    remove_index :reviews, :book_id
    add_index :reviews, :user_id
    add_index :reviews, :book_id
  end
end
