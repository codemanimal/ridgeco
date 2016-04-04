class ChangeBedroomsToFloat < ActiveRecord::Migration
  def change
  	change_column :listings, :bedroom, :float
  	change_column :listings, :bathroom, :float
  end
end
