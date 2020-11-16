class Profile < ApplicationRecord
  belongs_to :user

  validates :fullname, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  validates :user_id, presence: true

  has_one_attached :avatar
end
