describe RestfulApi::App::DevelopersHelper do
  let(:helper){ Class.new }
  before { helper.extend RestfulApi::App::DevelopersHelper }
  subject { helper }

  describe '#render_errors' do
    let(:developer) { build :developer, :invalid }

    before do
      developer.save
    end

    it 'returns a json with developer\'s errors' do
      response = helper.render_errors developer
      expected_response = {"errors": developer.errors}.to_json

      expect(response).to eq expected_response
    end
  end

end
