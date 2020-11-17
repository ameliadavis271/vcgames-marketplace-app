# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :listings
  has_one :address
  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile

<<<<<<< HEAD
  has_many :authored_cnversations, class_name: 'Conversation', foreign_key: 'author_id'
  has_many :received_cnversations, class_name: 'Conversation', foreign_key: 'receiver_id'
  has_many :personal_messages, dependent: :destroy
=======
has_many :authored_conversations, -> { order(updated_at: :desc)}, dependent: :destroy, class_name: 'Conversation', foreign_key: 'author_id'
has_many :received_conversations, -> { order(updated_at: :desc)}, dependent: :destroy, class_name: 'Conversation', foreign_key: 'receiver_id'
has_many :personal_messages, dependent: :destroy
>>>>>>> 2ac50e61ab1c705033e72a13b9e0c0eaa2311b06
end
