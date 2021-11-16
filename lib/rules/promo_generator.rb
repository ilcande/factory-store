require_relative './buy_x_get_y_free'
require_relative './bulk_purchase'

class PromoGenerator
  def self.generate_promo_for(type, *args)
    case type
    when 'BuyXGetYFree'
      return BuyXGetYFree.new(*args)
    when 'BulkPurchase'
      return BulkPurchase.new(*args)
    end
  end
end
