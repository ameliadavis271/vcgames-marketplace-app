# frozen_string_literal: true

class AddConsoleToListings < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :console, :string
  end
end
