require_relative '../../support/shared_examples/successful_response'

describe '/developers' do
  let(:url) { '/developers' }

  describe 'GET /' do

    before do
      get url
    end

    after do
      get url
    end

    it 'fetches all developers' do
      expect(Developer).to receive(:all)
    end

    context 'when no developer is found' do
      before do
        allow(Developer).to receive(:all).and_return([])

        get url
      end

      it 'returns an empty response body' do
        expect(last_response.body).to eq [].to_s
      end

      include_examples :successful_ok_response
    end

    context 'when there are developers found' do
      let(:developers) { build_list :developer, 2 }

      before do
        allow(Developer).to receive(:all).and_return(developers)

        get url
      end

      it 'returns the developers in the response body' do
        expect(last_response.body).to eq developers.to_json
      end

      include_examples :successful_ok_response
    end

  end

  describe 'DELETE /' do
    before do
      delete url
    end

    after do
      delete url
    end

    it 'deletes all developers' do
      expect(Developer).to receive(:delete_all)
    end

    include_examples :successful_no_content_response

  end

  describe 'POST /' do

    context 'when request body is empty' do
      before do
        post url
      end

      include_examples :unsuccessful_bad_request_response
    end

    context 'when request body is not empty' do
      let(:developer) { build :developer }

      before do
        allow(Developer).to receive(:new).and_return(developer)
      end

      after do
        post url, developer.to_json
      end

      it 'builds a new developer' do
        expect(Developer).to receive(:new).with(developer.as_json)
      end

      it 'saves the developer' do
        expect(developer).to receive(:save)
      end

      context 'when the developer is valid' do

        before do
          post url, developer.to_json
        end

        include_examples :successful_created_response
      end

      context 'when the developer is invalid' do
        let(:developer) { build :developer, :invalid }

        before do
          post url, developer.to_json
        end

        include_examples :unsuccessful_unprocessable_entity_response
      end
    end
  end

  describe 'GET /:id' do
    let(:developer) { build :developer }
    let(:id) { Faker::Number.digit }
    let(:uri) { url.dup.concat "/#{id}" }

    it 'fetches the developer with the provided :id' do
      expect(Developer).to receive(:find_by_id).with(id)

      get uri
    end

    context 'when it exists' do

      before do
        allow(Developer).to receive(:find_by_id).with(id).and_return(developer)

        get uri
      end

      it 'returns it' do
        expect(last_response.body).to eq developer.to_json
      end

      include_examples :successful_ok_response
    end

    context 'when it does not exist' do
      before do
        allow(Developer).to receive(:find_by_id).with(id).and_return(nil)

        get uri
      end

      it 'returns an empty body' do
        expect(last_response.body).to be_blank
      end

      include_examples :unsuccessful_not_found_response
    end
  end

  describe 'PATCH /:id' do
    let(:developer) { build :developer }
    let(:id) { Faker::Number.digit }
    let(:uri) { url.dup.concat "/#{id}" }

    context 'when request body is empty' do
      before do
        patch uri
      end

      include_examples :unsuccessful_bad_request_response
    end

    context 'when request body is not empty' do

      before do
        allow(Developer).to receive(:update).with(id, developer.as_json).and_return(developer)
      end

      it 'updates the developer\'s attributes' do
        expect(Developer).to receive(:update).with(id, developer.as_json)

        patch uri, developer.to_json
      end

      context 'when the developer exists' do
        before do
          allow(Developer).to receive(:update).with(id, developer.as_json).and_return(developer)

          patch uri, developer.to_json
        end

        context 'when it is valid' do
          include_examples :successful_no_content_response
        end

        context 'when it is not valid' do
          let(:developer) { build :developer, :invalid }

          include_examples :unsuccessful_unprocessable_entity_response
        end
      end

      context 'when the developer does not exist' do
        before do
          allow(Developer).to receive(:update).with(id, developer.as_json).and_raise(ActiveRecord::RecordNotFound)

          patch uri, developer.to_json
        end

        include_examples :unsuccessful_not_found_response
      end
    end
  end

  describe 'DELETE /:id' do
    let(:id) { Faker::Number.digit }
    let(:uri) { url.dup.concat "/#{id}" }

    it 'tries to delete the developer with the provided :id' do
      expect(Developer).to receive(:delete).with(id)

      delete uri
    end

    context 'when it was found and deleted' do
      before do
        allow(Developer).to receive(:delete).with(id).and_return(1)

        delete uri
      end

      include_examples :successful_no_content_response
    end

    context 'when it was not found' do
      before do
        allow(Developer).to receive(:delete).with(id).and_return(0)

        delete uri
      end

      include_examples :unsuccessful_not_found_response
    end
  end
end
