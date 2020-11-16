# frozen_string_literal: true

require 'rails_helper'

# MODEL TESTING

RSpec.describe Listing, type: :model do
  subject do
    Listing.new(name: 'My name is Amelia!', description: 'I like video games :)')
  end

  # checks that there are valid attributes listed above on Listing model for new
  it 'is valid with valid attributes' do
    # will help by printing input in test database
    p subject
    expect(subject).to be_valid
  end

  it 'is invalid without a name' do
    # this checks that listing name must be included
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is invalid if description exceeeds 280 characters' do
    # this tests the character length
    description = 'a' * 281
    subject.description = description
    expect(subject).to_not be_valid
  end
end
