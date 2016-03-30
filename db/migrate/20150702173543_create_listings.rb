class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
    	t.string :name
    	t.string :address
    	t.string :unit
    	t.string :city
    	t.string :state
    	t.string :zip
    	t.string :price
    	t.string :type
    	t.integer :bedroom
    	t.integer :bathroom
    	t.string :sqft
    	t.string :detail
    	t.string :feature
    	t.text :description
    	t.integer :mls_id
    	t.text :mls_url
        t.boolean :is_sold?
        t.boolean :is_in_contract?
        t.boolean :is_under_review?
    	t.text :asset1
    	t.text :asset2
    	t.text :asset3
    	t.text :asset4
    	t.text :asset5
    	t.text :asset6
    	t.text :asset7
    	t.text :asset8
    	t.text :asset9
    	t.text :asset10

    	t.timestamps
    end
  end
end
