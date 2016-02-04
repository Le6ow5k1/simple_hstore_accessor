# coding: utf-8
require 'spec_helper'

describe Dummies::DummySubclass do
  let(:dummy) { described_class.new(latitude: 7, longitude: 11) }

  it { expect(dummy).to respond_to(:properties) }

  it { expect(dummy).to respond_to(:latitude) }
  it { expect(dummy).to respond_to(:latitude=) }
  it { expect(dummy).to respond_to(:latitude_will_change!) }
  it { expect(dummy).to respond_to(:latitude_changed?) }

  it { expect(dummy).to respond_to(:longitude) }
  it { expect(dummy).to respond_to(:longitude=) }
  it { expect(dummy).to respond_to(:longitude_will_change!) }
  it { expect(dummy).to respond_to(:longitude_changed?) }

  it { expect(dummy).to respond_to(:write_attribute) }
  it { expect(dummy).to respond_to(:read_attribute) }

  describe '#latitude=' do
    it { expect { dummy.latitude = 14 }.to change { dummy.latitude }.from(7).to(14) }
  end

  describe '#write_attribute' do
    context 'when called with hstore attribute' do
      before { dummy.write_attribute(:longitude, 5) }

      it { expect(dummy.longitude).to eq(5) }
    end

    context 'when called with regular attribute' do
      before { dummy.write_attribute(:regular_attribute, 'changed') }

      it { expect(dummy.regular_attribute).to eq('changed') }
    end
  end

  describe '#read_attribute' do
    context 'when called with hstore attribute' do
      it { expect(dummy.read_attribute(:longitude)).to eq(dummy.longitude) }
    end

    context 'when called with regular attribute' do
      it { expect(dummy.read_attribute(:regular_attribute)).to eq(dummy.regular_attribute) }
    end
  end
end
