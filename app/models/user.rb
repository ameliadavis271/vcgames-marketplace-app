# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Relationships
  has_many :listings
  has_many :payments
  has_one :profile, dependent: :destroy
  has_many :authored_conversations, -> { order(updated_at: :desc) }, dependent: :destroy, class_name: 'Conversation', foreign_key: 'author_id'
  has_many :received_conversations, -> { order(updated_at: :desc) }, dependent: :destroy, class_name: 'Conversation', foreign_key: 'receiver_id'
  has_many :personal_messages, dependent: :destroy

  # Validations
  validates :username, presence: true, length: { minimum: 8, maximum: 15 }
  validates :email, presence: true

  accepts_nested_attributes_for :profile
end
