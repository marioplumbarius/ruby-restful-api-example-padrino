describe Serializer do
  let(:keys) { [:projects] }
  let(:object) { build :developer }
  subject(:serializer) { described_class.new object, keys }

  describe '#initialize' do

    context 'when keys parameter is provided' do

      it 'assigns it to @keys' do
        expect(serializer.instance_variable_get(:@keys)).to eq keys
      end

      it 'assigns @object' do
        expect(serializer.instance_variable_get(:@object)).to eq object
      end
    end

    context 'when keys parameter is not provided' do
      subject(:serializer) { described_class.new object }

      it 'assigns an empty array to @keys' do
        expect(serializer.instance_variable_get(:@keys)).to be_empty
      end

      it 'assigns @object' do
        expect(serializer.instance_variable_get(:@object)).to eq object
      end
    end
  end

  describe '#render' do
    let(:method_response) { nil }

    context 'when @keys is not empty' do
      let(:method_response) { (described_class.new object, keys).render }

      it 'returns the json with its @keys included' do
        expect(method_response).to eq object.to_json include: keys
      end
    end

    context 'when @keys is empty' do
      let(:method_response) { (described_class.new object).render }

      it 'returns json without its @keys included' do
        expect(method_response).to eq object.to_json
      end
    end

  end
end
