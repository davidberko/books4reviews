class AddRankingToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :ranking, :integer 
  end
end
