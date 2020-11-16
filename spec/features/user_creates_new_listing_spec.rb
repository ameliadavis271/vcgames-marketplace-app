# frozen_string_literal: true

require 'rails_helper'

# CAPYBARA TESTING

RSpec.feature 'on index page' do
  # will run this code before all tests in the wrapped feature
  before(:each) do
    visit new_listing_path
  end
  scenario 'user successfully navigates to /listing/new' do
    # checks current path
    expect(page).to have_current_path(new_listing_path)
  end
  scenario 'user can fill out a form to create a new listing, then is redirected back to listings index' do
    # checks that the following text fields can be filled, form submitted and redirected back to index page
    listing_name = 'Capybara test!'
    fill_in 'Name', with: listing_name
    fill_in 'Description', with: 'It works!'
    click_on 'Create Listing'
    expect(page).to have_current_path(listings_path)
    expect(page).to have_css('p', text: listing_name)
  end
end
