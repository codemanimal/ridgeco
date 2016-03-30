class Listing < ActiveRecord::Base

	# Define associations and validations
	has_and_belongs_to_many :brokers

	# Define scope for search and filter functionality
	scope :selected_listing, ->(listing_id) { where("mls_id = ?", listing_id) }

  def self.selected_price(price)
    if (price != 10000000)
      where("price < ?", price)
    else
      where("price >= 10000000")
    end
  end

  def self.has_bedrooms(bedrooms)
    if (bedrooms != 9) 
      where(bedroom: bedrooms)
    else
      where("bedroom >= 9")
    end
  end

  def self.has_bathrooms(bathrooms)
    if (bathrooms != 9) 
      where(bathroom: bathrooms)
    else
      where("bathroom >= 9")
    end
  end
end