# frozen_string_literal: true

require_relative '../lib/checkout'
require 'pry'

describe Checkout do
  let(:checkout) { Checkout.new('./spec/fixtures/datastore.json') }
  let(:keyring) { [{ 'name' => 'Keyring', 'price' => 3.0 }] }

  describe '#scan' do
    context 'empty code' do
      it { expect(checkout.scan('')).to be_nil }
    end

    context 'catalogue does not include an item' do
      it { expect(checkout.scan('WALLPAPER')).to be_nil }
    end

    context 'catalogue includes an item' do
      it { expect(checkout.scan('KEYRING')).to eq(keyring) }
    end
  end

  describe '#total' do
    context 'of %w(KEYRING POSTER MAGNET)' do
      before do
        checkout.scan('KEYRING')
        checkout.scan('POSTER')
        checkout.scan('MAGNET')
      end

      it { expect(checkout.total).to eq 14.5 }
    end

    context 'of %w(KEYRING POSTER KEYRING)' do
      before do
        checkout.scan('KEYRING')
        checkout.scan('POSTER')
        checkout.scan('KEYRING')
      end

      it { expect(checkout.total).to eq 13.0 }
    end

    context 'of %w(POSTER POSTER POSTER KEYRING POSTER)' do
      before do
        checkout.scan('POSTER')
        checkout.scan('POSTER')
        checkout.scan('POSTER')
        checkout.scan('KEYRING')
        checkout.scan('POSTER')
      end

      it { expect(checkout.total).to eq 33.0 }
    end

    context 'of %w(KEYRING POSTER KEYRING KEYRING MAGNET POSTER POSTER)' do
      before do
        checkout.scan('KEYRING')
        checkout.scan('POSTER')
        checkout.scan('KEYRING')
        checkout.scan('KEYRING')
        checkout.scan('MAGNET')
        checkout.scan('POSTER')
        checkout.scan('POSTER')
      end

      it { expect(checkout.total).to eq 30.0 }
    end
  end
end
