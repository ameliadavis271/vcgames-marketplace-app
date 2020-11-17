class RemoveBrandFromListings < ActiveRecord::Migration[6.0]
  def change
    remove_column :listings, :brand, :string
  end
end
