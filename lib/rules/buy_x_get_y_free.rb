require_relative './min_items_per_promo'

class BuyXGetYFree < MinItemsPerPromo
  def apply_rule_to(items)
    items_free = (items.length / @min_items_per_promo) * @value
    total_price = items.length * items.first['price']
    discount = items.first['price'] * items_free

    (total_price - discount) / items.length
  end

end
