shared_examples_for :cannot_connect_ro_redis do |object, method, *args|
  context 'when it cannot connect to redis server' do

    before do
      allow_any_instance_of(Redis).to receive(method).and_raise(Redis::CannotConnectError)
    end

    context 'with silent set to false' do
      let(:silent) { false }
      let(:arguments) { args.dup.push silent }

      it 'raises Redis::CannotConnectError error' do
        expect { object.method(method).call(*arguments) }.to raise_error(Redis::CannotConnectError)
      end
    end

    context 'with silent set to true' do
      let(:silent) { true }
      let(:arguments) { args.dup.push silent }

      it 'does not raise Redis::CannotConnectError error' do
        expect { object.method(method).call(*arguments) }.not_to raise_error
      end
    end

    context 'with silent set to nil' do
      let(:silent) { nil }
      let(:arguments) { args.dup.push silent }

      it 'does not raise Redis::CannotConnectError error' do
        expect { object.method(method).call(*arguments) }.to raise_error(Redis::CannotConnectError)
      end
    end

    context 'with silent not set' do
      let(:arguments) { args.dup }

      it 'does not raise Redis::CannotConnectError error' do
        expect { object.method(method).call(*arguments) }.not_to raise_error
      end
    end
  end
end
