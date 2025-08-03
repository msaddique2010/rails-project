require "httparty"

class FetchProductsJob < ApplicationJob
  queue_as :default

  def perform
    url = "https://fakestoreapi.com/products"
    response = HTTParty.get(url)
    return unless response.code == 200

    products = JSON.parse(response.body)

    products.each do |api_product|
      Product.find_or_initialize_by(api_id: api_product["id"]).tap do |product|
        product.name = api_product["title"].upcase      # FIXED: changed from 'title' to 'name'
        product.description = api_product["description"]
        product.save!
      end
    end
  rescue => e
    Rails.logger.error "FetchProductsJob failed: #{e.message}"
  end
end
