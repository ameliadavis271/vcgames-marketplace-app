# frozen_string_literal: true

class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:webhook]

  def success; end

  def cancel; end

  def webhook
    payment_id = params[:data][:object][:payment_intent]
    payment = Stripe::PaymentIntent.retrieve(payment_id)
    listing_id = payment.metadata.listing_id
    p 'Listing id ' + listing_id
    render plain: 'Success'

    listing = Listing.find(listing_id)
    listing.update(sold: true)
  end
end
