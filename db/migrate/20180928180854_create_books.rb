class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
