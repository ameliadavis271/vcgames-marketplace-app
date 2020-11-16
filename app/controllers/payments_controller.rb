# frozen_string_literal: true

class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def checkout
    # session = Stripe::Checkout::Session.create(
    #   payment_method_types: ['card'],
    #   customer_email: current_user.email,
    #   line_items: [{
    #     name: @listing.name,
    #     description: @listing.description,
    #     # picture: @listing.picture,
    #     amount: (@listing.price * 100).to_i,
    #     currency: 'aud',
    #     quantity: 1,
    #   }],
    #   payment_intent_data: {
    #     metadata: {
    #       listing_id: @listing.id
    #     }
    #   },
    #   success_url: "#{root_url}payments/success?listingId=#{@listing.id}",
    #   cancel_url: "#{root_url}listings"
    # )
    # @session_id = session.id
    # # render json: { id: session.id }
  end
end
