class ChangeListingPriceToInteger < ActiveRecord::Migration
  def change
     remove_column :listings, :price
     add_column :listings, :price, :integer, default: 0
   end
end
