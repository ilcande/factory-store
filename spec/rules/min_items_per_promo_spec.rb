# frozen_string_literal: true

require_relative '../../lib/rules/min_items_per_promo'

describe MinItemsPerPromo do
  describe '#applies_to' do
    let(:min_items_per_promo) { 2 }
    let(:value) { 1 }
    let(:rule) { MinItemsPerPromo.new(min_items_per_promo, value) }

    context 'rule does not apply if items is less than min_items_per_promo' do
      let(:items) { [1] }

      it { expect(rule.applies_to(items)).to be_falsy }
    end

    context 'rule applies if items is equal to min_items_per_promo' do
      let(:items) { [1, 2] }

      it { expect(rule.applies_to(items)).to be_truthy }
    end

    context 'rule applies if items is greater than min_items_per_promo' do
      let(:items) { [1, 2, 3] }

      it { expect(rule.applies_to(items)).to be_truthy }
    end
  end
end
