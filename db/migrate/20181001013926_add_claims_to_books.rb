class AddClaimsToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :claims, :boolean, default: false 
  end
end
