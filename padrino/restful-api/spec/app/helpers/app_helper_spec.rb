require_relative '../../support/helpers/http_executor_helper'

describe RestfulApi::App::AppHelper do

  # setting up padrino's helper
  # see http://wikimatze.de/testing-helpers-in-padrino/
  subject(:helper) do
    class AppHelperClass
      include RestfulApi::App::AppHelper
    end

    AppHelperClass.new
  end

  describe '#body_valid?' do
    let(:body) { nil }
    let(:valid_keys) { ['a', 'b', 'c'] }

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

    ["PUT", "PATCH", "POST"].each do |http_method_name|
      context "when http method is #{http_method_name}" do
        let(:mocked_request) { HttpExecutorHelper.execute_request http_method_name }

        it 'returns true' do
          method_response = helper.request_requires_body?mocked_request
          expect(method_response).to be_truthy
        end
      end
    end

    ["GET", "DELETE"].each do |http_method_name|
      context "when http method is #{http_method_name}" do
        let(:mocked_request) { HttpExecutorHelper.execute_request http_method_name }

        it 'returns false' do
          method_response = helper.request_requires_body?mocked_request
          expect(method_response).to be_falsy
        end
      end
    end
  end

end
