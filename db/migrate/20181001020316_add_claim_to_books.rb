class AddClaimToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :claim, :boolean, default: false 
  end
end
