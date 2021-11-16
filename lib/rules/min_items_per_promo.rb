class MinItemsPerPromo
  attr_accessor :min_items_per_promo, :value

  def initialize(min_items_per_promo, value)
    @min_items_per_promo = min_items_per_promo
    @value = value
  end

  def applies_to(items)
    items.length >= @min_items_per_promo
  end
end
