class DropDescriptionFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :description
  end
end
