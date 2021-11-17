# frozen_string_literal: true

require_relative './min_items_per_promo'

# class BulkPurchase < MinItemsPerPromo
class BulkPurchase < MinItemsPerPromo
  # it returns the new price value if the offer applies
  def apply_rule_to(_items)
    value
  end
end
