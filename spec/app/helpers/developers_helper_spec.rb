describe RestfulApi::App::DevelopersHelper do

  describe '::DEVELOPER_CACHE_KEY_PREFIX' do
    it 'returns the default cache key for developers' do
      expect(described_class::DEVELOPER_CACHE_KEY_PREFIX).to eq 'developer:'
    end
  end

  describe '::DEVELOPER_CACHE_DEFAULT_EXPIRATION' do
    it 'returns the default expiration for developers' do
      expect(described_class::DEVELOPER_CACHE_DEFAULT_EXPIRATION).to eq 10
    end
  end
end
