class AddUnhelpfulToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :unhelpful, :boolean, default: false 
  end
end
