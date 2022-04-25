rentals = JSON.parse(File.read(Rails.root.join('db', 'rentals.json')))['data']

rentals.each do |rental|
  flat_attribute_names = %w[title owner city category bedrooms image description]

  attribute_hash = flat_attribute_names.map do |name|
    [name, rental['attributes'][name]]
  end.to_h

  attribute_hash['url_slug'] = rental['id']

  %w[lat lng].each do |coordinate|
    attribute_hash[coordinate] = rental['attributes']['location'][coordinate]
  end

  Rental.create(attribute_hash)
end
