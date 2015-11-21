require_relative '../../support/shared_examples/successful_response'

describe '/projects' do
  let(:url) { '/projects' }

  describe 'GET /' do

    before do
      get url
    end

    after do
      get url
    end

    it 'fetches all projects' do
      expect(Project).to receive(:all)
    end

    context 'when no project is found' do
      before do
        allow(Project).to receive(:all).and_return([])

        get url
      end

      it 'returns an empty response body' do
        expect(last_response.body).to eq [].to_s
      end

      include_examples :successful_ok_response
    end

    context 'when there are projects found' do
      let(:projects) { build_list :project, 2 }

      before do
        allow(Project).to receive(:all).and_return(projects)

        get url
      end

      it 'returns the projects in the response body' do
        expect(last_response.body).to eq projects.to_json
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

    it 'deletes all projects' do
      expect(Project).to receive(:delete_all)
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
      let(:project) { build :project }

      before do
        allow(Project).to receive(:new).and_return(project)
      end

      after do
        post url, project.to_json
      end

      it 'builds a new project' do
        expect(Project).to receive(:new).with(JSON.parse(project.to_json))
      end

      it 'saves the project' do
        expect(project).to receive(:save)
      end

      context 'when the project is valid' do

        before do
          post url, project.to_json
        end

        include_examples :successful_created_response
      end

      context 'when the project is invalid' do
        let(:project) { build :project, :invalid }

        before do
          post url, project.to_json
        end

        include_examples :unsuccessful_unprocessable_entity_response
      end
    end
  end

  describe 'GET /:id' do
    let(:project) { build :project }
    let(:id) { Faker::Number.digit }
    let(:uri) { url.dup.concat "/#{id}" }

    it 'fetches the project with the provided :id' do
      expect(Project).to receive(:find_by_id).with(id)

      get uri
    end

    context 'when it exists' do

      before do
        allow(Project).to receive(:find_by_id).with(id).and_return(project)

        get uri
      end

      it 'returns it' do
        expect(last_response.body).to eq project.to_json
      end

      include_examples :successful_ok_response
    end

    context 'when it does not exist' do
      before do
        allow(Project).to receive(:find_by_id).with(id).and_return(nil)

        get uri
      end

      it 'returns an empty body' do
        expect(last_response.body).to be_blank
      end

      include_examples :unsuccessful_not_found_response
    end
  end

  describe 'PATCH /:id' do
    let(:project) { build :project }
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
        allow(Project).to receive(:update).with(id, JSON.parse(project.to_json)).and_return(project)
      end

      it 'updates the project\'s attributes' do
        expect(Project).to receive(:update).with(id, JSON.parse(project.to_json))

        patch uri, project.to_json
      end

      context 'when the project exists' do
        before do
          allow(Project).to receive(:update).with(id, JSON.parse(project.to_json)).and_return(project)

          patch uri, project.to_json
        end

        context 'when it is valid' do
          include_examples :successful_no_content_response
        end

        context 'when it is not valid' do
          let(:project) { build :project, :invalid }

          include_examples :unsuccessful_unprocessable_entity_response
        end
      end

      context 'when the project does not exist' do
        before do
          allow(Project).to receive(:update).with(id, JSON.parse(project.to_json)).and_raise(ActiveRecord::RecordNotFound)

          patch uri, project.to_json
        end

        include_examples :unsuccessful_not_found_response
      end
    end
  end

  describe 'DELETE /:id' do
    let(:id) { Faker::Number.digit }
    let(:uri) { url.dup.concat "/#{id}" }

    it 'tries to delete the project with the provided :id' do
      expect(Project).to receive(:delete).with(id)

      delete uri
    end

    context 'when it was found and deleted' do
      before do
        allow(Project).to receive(:delete).with(id).and_return(1)

        delete uri
      end

      include_examples :successful_no_content_response
    end

    context 'when it was not found' do
      before do
        allow(Project).to receive(:delete).with(id).and_return(0)

        delete uri
      end

      include_examples :unsuccessful_not_found_response
    end
  end
end
