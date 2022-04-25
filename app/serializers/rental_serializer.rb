class RentalSerializer
  include JSONAPI::Serializer

  set_type :rentals
  set_id :url_slug

  attributes :id, :title, :owner, :city, :category, :bedrooms, :image
  attribute :location do |rental|
    {
      lat: rental.lat,
      lng: rental.lng
    }
  end

  set_key_transform :camel_lower
end
