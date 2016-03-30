class ChangeTypeColumnName < ActiveRecord::Migration
  def change
  	change_table :listings do |t|
  		t.rename :type, :listing_type
  	end
  end
end
