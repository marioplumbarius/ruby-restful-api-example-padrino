describe DeveloperSerializer, focus: true do
  let(:object) { build :project }
  subject{ described_class.new object }

  it 'extends Serializer' do
    expect(subject).to be_a Serializer
  end

  describe '#initialize' do
    it 'calls its super constructor with object' do
      expect(subject.instance_variable_get(:@object)).to eq object
    end

    it 'calls its super constructor with :::KEYS' do
      expect(subject.instance_variable_get(:@keys)).to eq described_class::KEYS
    end
  end

  describe '::KEYS' do
    it 'contains :projects symbol' do
      expect(described_class::KEYS).to include :projects
    end
  end
end
