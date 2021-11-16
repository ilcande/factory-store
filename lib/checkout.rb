require 'yaml'

class Checkout
  # checkout constructor
  def initialize(path = "config/datastore.yml")
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

  private

  # it returns the catalogue
  def catalogue
    return @catalogue unless @catalogue.nil?

    @catalogue = YAML.load_file(@path)["products"]
    @catalogue
  end
end
