# frozen_string_literal: true

class AddUserRefToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_reference :profiles, :user, null: false, foreign_key: true
  end
end
