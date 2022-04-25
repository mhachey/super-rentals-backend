class Rental < ApplicationRecord
  attr_accessor :title, :owner, :city, :lat, :lng, :category, :bedrooms, :image, :url_slug
end
