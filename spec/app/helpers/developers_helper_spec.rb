describe RestfulApi::App::DevelopersHelper do
  subject { described_class }
  let(:cache_key) { 'developer:' }
  let(:cache_expiration) { 10 }

  describe '::CACHE::DEFAULT_KEY_PREFIX' do
    it 'returns the default cache key for developers' do
      expect(subject::CACHE::DEFAULT_KEY_PREFIX).to eq cache_key
    end
  end

  describe '::CACHE::DEFAULT_EXPIRATION' do
    it 'returns the default expiration for developers' do
      expect(subject::CACHE::DEFAULT_EXPIRATION).to eq cache_expiration
    end
  end
end
