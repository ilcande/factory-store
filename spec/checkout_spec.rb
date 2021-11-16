require_relative '../lib/checkout'
require 'pry'

describe Checkout do
  let(:checkout) { Checkout.new("./spec/fixtures/datastore.yml") }
  let(:keyring) { [{"name"=>"Keyring", "price"=>3.0}] }

  describe '#scan' do
    context 'empty code' do
      it { expect(checkout.scan("")).to be_nil }
    end

    context 'catalogue does not include an item' do
      it { expect(checkout.scan("WALLPAPER")).to be_nil }
    end

    context 'catalogue includes an item' do
      it { expect(checkout.scan("KEYRING")).to eq(keyring) }
    end
  end
end
