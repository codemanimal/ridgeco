class BrokersListings < ActiveRecord::Migration
  def change
  	create_join_table :brokers, :listings
  end
end
