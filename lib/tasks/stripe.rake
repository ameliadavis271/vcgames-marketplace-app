# frozen_string_literal: true

namespace :stripe do
  desc 'Test Stripe'
  task :test do
    Stripe.api_key = Rails.application.credentials.dig(:stripe, :secret_key)

    puts Stripe::PaymentIntent.create({
                                        amount: 1000,
                                        currency: 'usd',
                                        payment_method_types: ['card'],
                                        receipt_email: 'jenny.rosen@example.com'
                                      })
  end
end
