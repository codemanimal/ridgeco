class CreateBrokers < ActiveRecord::Migration
  def change
    create_table :brokers do |t|
    	t.string   :username
    	t.string   :password_digest
    	t.string   :first_name
    	t.string   :last_name
    	t.string   :cell
    	t.string   :office
    	t.string   :fax
    	t.string   :address
    	t.string   :city
    	t.string   :state
    	t.string   :zip
    	t.string   :email
    	t.text     :about
    	t.text     :portrait

    	t.timestamps
    end
  end
end
