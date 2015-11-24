require_relative '../support/shared_examples/redis_shared_examples'

describe RedisProvider do
  subject { described_class }

  describe '.get' do
    let(:key) { Faker::Lorem.word }
    let(:value) { Faker::Lorem.word }
    let(:silent) { nil }

    before do
      allow_any_instance_of(Redis).to receive(:get).with(key).and_return(value)
    end

    it 'fetches the value from redis' do
      expect_any_instance_of(Redis).to receive(:get).with(key)

      subject.get key
    end

    it 'returns the value from redis' do
      expect(subject.get key).to eq value
    end

    include_examples :cannot_connect_ro_redis, described_class, :get, Faker::Lorem.word
  end

  describe '.set' do
    let(:key) { Faker::Lorem.word }
    let(:value) { Faker::Lorem.word }
    let(:ex) { Faker::Number.digit }
    let(:silent) { nil }

    it 'sets the value in redis' do
      expect_any_instance_of(Redis).to receive(:set).with(key, value, ex: ex)

      subject.set key, value, ex, silent
    end

    include_examples :cannot_connect_ro_redis, described_class, :get, Faker::Lorem.word
  end

  describe '.del' do
    let(:key) { Faker::Lorem.word }
    let(:silent) { nil }

    it 'deletes the value from redis' do
      expect_any_instance_of(Redis).to receive(:del).with(key)

      subject.del key
    end

    include_examples :cannot_connect_ro_redis, described_class, :get, Faker::Lorem.word
  end
end
