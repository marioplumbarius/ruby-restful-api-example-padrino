require_relative '../../support/helpers/http_executor_helper'

describe RestfulApi::App::AppHelper do
  let(:helper){ Class.new }
  before { helper.extend RestfulApi::App::AppHelper }
  subject { helper }

  describe '#body_valid?' do
    let(:body) { nil }
    let(:valid_keys) { %w(a b c) }

    context 'with valid body' do
      let(:body) { {a: 1, b: 2, c: 3}.as_json }

      it 'returns true' do
        valid = helper.body_valid? body, valid_keys

        expect(valid).to be_truthy
      end
    end

    context 'with invalid body' do
      let(:body) { {d: 4}.as_json }

      it 'returns false' do
        valid = helper.body_valid? body, valid_keys

        expect(valid).to be_falsy
      end
    end
  end

  describe '#request_requires_body?' do
    let(:mocked_request) { nil }

    %w(PUT PATCH POST).each do |http_method_name|
      context "when http method is #{http_method_name}" do
        let(:mocked_request) { HttpExecutorHelper.execute_request http_method_name }

        it 'returns true' do
          method_response = helper.request_requires_body? mocked_request
          expect(method_response).to be_truthy
        end
      end
    end

    %w(GET DELETE).each do |http_method_name|
      context "when http method is #{http_method_name}" do
        let(:mocked_request) { HttpExecutorHelper.execute_request http_method_name }

        it 'returns false' do
          method_response = helper.request_requires_body? mocked_request
          expect(method_response).to be_falsy
        end
      end
    end
  end

  describe '#sinatra_error_is_a?' do
    let(:sinatra_error) { nil }
    let(:env) { { "#{RestfulApi::App::AppHelper::SINATRA_ERROR_KEY_NAME}": nil } }
    let(:klass) { ActiveRecord::UnknownAttributeError }

    context 'when sinatra.error is not blank' do
      context 'when it is of type klass' do
        let(:sinatra_error) { klass.new Faker::Lorem.word, Faker::Lorem.word }

        before do
          env[RestfulApi::App::AppHelper::SINATRA_ERROR_KEY_NAME] = sinatra_error
        end

        it 'returns true' do
          method_response = helper.sinatra_error_is_a? env, klass

          expect(method_response).to be_truthy
        end
      end

      context 'when it is not of type klass' do
        let(:sinatra_error) { ArgumentError.new }

        before do
          env[RestfulApi::App::AppHelper::SINATRA_ERROR_KEY_NAME] = sinatra_error
        end

        it 'returns false' do
          method_response = helper.sinatra_error_is_a? env, klass

          expect(method_response).to be_falsy
        end
      end
    end

    context 'when sinatra.error is blank' do
      it 'returns false' do
        method_response = helper.sinatra_error_is_a? env, klass

        expect(method_response).to be_falsy
      end
    end
  end

end
