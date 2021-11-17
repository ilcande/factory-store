# frozen_string_literal: true

require_relative '../../lib/rules/buy_x_get_y_free'

describe BuyXGetYFree do
  describe '#apply_rule_to' do
    let(:buy_x_items) { 2 }
    let(:get_y_free_items) { 1 }
    let(:rule) { BuyXGetYFree.new(buy_x_items, get_y_free_items) }
    let(:list) { [] }
    let(:price) { 3.0 }

    before(:each) do
      num_items.times do
        list << { 'name' => 'Keyring', 'price' => price }
      end
    end

    context 'num of items in checkout is lower than buy_x_items' do
      let(:num_items) { 1 }

      it { expect(rule.apply_rule_to(list)).to eq(price) }
    end

    context 'num of items in checkout is greater than buy_x_items' do
      let(:num_items) { 4 }

      it { expect(rule.apply_rule_to(list)).to eq(price / buy_x_items) }
    end

    context 'num of items in checkout is equal to buy_x_items' do
      let(:num_items) { 2 }

      it { expect(rule.apply_rule_to(list)).to eq(price / buy_x_items) }
    end
  end
end
