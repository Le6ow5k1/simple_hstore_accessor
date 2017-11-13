require 'spec_helper'

describe DummyJson do
  it_behaves_like 'general behavior of model attributes', described_class

  context 'when store attribute is used as an association key' do
    let(:dummy_association) { DummyJsonAssociation.create }
    let(:dummy) { described_class.create }

    before do
      dummy.dummy_json_association = dummy_association
      dummy.save
    end

    describe '#dummy_json_association_id' do
      it { expect(dummy.dummy_json_association_id.to_i).to eq(dummy_association.id) }
    end

    describe '#dummy_json_association' do
      it { expect(described_class.find(dummy.id).dummy_json_association).to eq(dummy_association) }
    end
  end
end
