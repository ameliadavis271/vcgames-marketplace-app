class AddConsoleToListings < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :console, :string
  end
end
