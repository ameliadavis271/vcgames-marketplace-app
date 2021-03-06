# frozen_string_literal: true

class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :name
      t.string :description
      t.float :price
      t.boolean :sold

      t.timestamps
    end
  end
end
