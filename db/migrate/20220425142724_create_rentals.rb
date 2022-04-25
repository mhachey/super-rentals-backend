class CreateRentals < ActiveRecord::Migration[6.1]
  def change
    create_table :rentals do |t|
      t.string :title
      t.string :owner
      t.string :city
      t.float :lat
      t.float :lng
      t.string :category
      t.integer :bedrooms
      t.string :image
      t.string :description
      t.string :url_slug

      t.timestamps
    end
  end
end
