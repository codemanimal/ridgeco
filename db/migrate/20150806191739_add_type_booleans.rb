class AddTypeBooleans < ActiveRecord::Migration
  def change
  	add_column :listings, :is_rental, :boolean
  	add_column :listings, :is_sale, :boolean
  	add_column :listings, :is_development, :boolean
  end
end
