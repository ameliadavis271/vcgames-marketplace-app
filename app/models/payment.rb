# frozen_string_literal: true

class Payment < ApplicationRecord
  # Relationships
  belongs_to :user
  belongs_to :listing
end
