class AddAdminToBrokers < ActiveRecord::Migration
  def change
  	add_column :brokers, :is_admin, :boolean
  end
end
