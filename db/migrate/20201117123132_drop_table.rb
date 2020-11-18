# frozen_string_literal: true

class DropTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :addresses
    drop_table :messages
  end
end
