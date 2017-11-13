# coding: utf-8
require 'spec_helper'

describe Dummy do
  it_behaves_like 'general behavior of model attributes', described_class

  context 'when store attribute is used as an association key' do
    let(:dummy_association) { DummyAssociation.create }
    let(:dummy) { described_class.create }

    before do
      dummy.dummy_association = dummy_association
      dummy.save
    end

    describe '#dummy_association_id' do
      it { expect(dummy.dummy_association_id.to_i).to eq(dummy_association.id) }
    end

    describe '#dummy_association' do
      it { expect(described_class.find(dummy.id).dummy_association).to eq(dummy_association) }
    end
  end
end
