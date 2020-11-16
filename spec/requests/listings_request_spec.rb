# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Listings', type: :request do
  context '#index' do
    it '' do # leaving blank produces own message
      get listings_path
      expect(response).to have_http_status(200)
    end
  end

  context '#create' do
    it 'redirects to #index' do
      post listings_path, params: { listing: { name: 'A new listing', description: 'awwwwww YIS' } }
      expect(response).to redirect_to(listings_path)
    end

    # it "on validation failure it renders the number of errors" do
    #   post listings_path, params: { listing: { name: "", description: ""} }
    #   expect(response.name).to include("1 error prohibited this listing from being saved")
    #   expect(response.description).to include("1 error prohibited this listing from being saved")
    # end
  end
end
