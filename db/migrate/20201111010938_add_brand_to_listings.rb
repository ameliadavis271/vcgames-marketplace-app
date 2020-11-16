# frozen_string_literal: true

class AddBrandToListings < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :brand, :string
  end
end
