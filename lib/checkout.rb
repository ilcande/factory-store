require_relative './rules/promo_generator'
require 'json'
require 'yaml'

class Checkout
  # checkout constructor
  def initialize(path = 'config/datastore.json')
    @cart = {}
    @path = path
    @catalogue = nil
    @discounts = nil
  end

  # it adds a product to the cart
  def scan(code)
    return unless catalogue.include?(code)

    @cart[code] = [] if @cart[code].nil?
    @cart[code] << catalogue[code]
  end

  # it calculates total amount for cart
  def total
    return 0 if @cart.empty?

    total_price = 0
    @cart.each do |code, list|
     total_price += price_per_item(code, list) * list.length
    end

    total_price
  end


  private

  # it returns the catalogue
  def catalogue
    return @catalogue unless @catalogue.nil?

    @catalogue = JSON.parse(File.read(@path))['products']
    @catalogue
  end

  # it returns the price per item
  def price_per_item(code, list)
    return list.first['price'] unless discounts.include?(code)

    @discounts[code].each do |name, rule|
      return rule.apply_rule_to(list) if rule.applies_to(list)
    end

    list.first['price']
  end

  # it returns the discounts
  def discounts
    return @discounts unless @discounts.nil?

    @discounts = JSON.parse(File.read(@path))['discounts']
    @discounts.each do |code, discounts|
      discounts.each do |type, rule|
        @discounts[code][type] = PromoGenerator.generate_promo_for(type, rule['min_items_per_promo'], rule['value'])
      end
    end

    @discounts
  end
end
