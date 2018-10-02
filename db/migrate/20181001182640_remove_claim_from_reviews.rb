class RemoveClaimFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :claim 
  end
end
