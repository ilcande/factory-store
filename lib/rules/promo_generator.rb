# frozen_string_literal: true

require_relative './buy_x_get_y_free'
require_relative './bulk_purchase'

# class PromoGenerator
class PromoGenerator
  # use Factory Pattern to create rules
  def self.generate_promo_for(type, *args)
    case type
    when 'BuyXGetYFree'
      BuyXGetYFree.new(*args)
    when 'BulkPurchase'
      BulkPurchase.new(*args)
    end
  end
end
