class RemoveClaimsFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :claims 
  end
end
