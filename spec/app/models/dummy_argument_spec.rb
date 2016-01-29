# coding: utf-8
require 'spec_helper'

describe DummyArgument do
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
end
