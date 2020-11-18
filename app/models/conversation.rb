# frozen_string_literal: true

class Conversation < ApplicationRecord
  # Relationships
  has_many :personal_messages, -> { order(updated_at: :asc) }, dependent: :destroy
  belongs_to :author, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  # Validations
  validates :author, uniqueness: { scope: :receiver }

  # Methods
  def with(current_user)
    author == current_user ? receiver : author
  end

  def participates?(user)
    author == user || receiver == user
  end

  # Scopes
  scope :participating, lambda { |user|
    where('(conversations.author_id = ? OR conversations.receiver_id = ?)', user.id, user.id)
  }

  scope :between, lambda { |sender_id, receiver_id|
    where(author_id: sender_id, receiver_id: receiver_id).or(where(author_id: receiver_id, receiver_id: sender_id)).limit(1)
  }
end
