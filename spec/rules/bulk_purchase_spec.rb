# frozen_string_literal: true

require_relative '../../lib/rules/bulk_purchase'

describe BulkPurchase do
  describe '#apply_rule_to' do
    let(:buy_x_items) { 3 }
    let(:promo_price) { 7.5 }
    let(:rule) { BulkPurchase.new(buy_x_items, promo_price) }
    let(:list) { [] }
    let(:price) { 10.0 }

    before do
      num_items.times do
        list << { 'name' => 'Poster', 'price' => price }
      end
    end

    context 'num of items in checkout is equal to buy_x_items' do
      let(:num_items) { 3 }

      it { expect(rule.apply_rule_to(list)).to eq(promo_price) }
    end
  end
end
