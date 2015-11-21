describe RestfulApi::App::DevelopersHelper do

  # setting up padrino's helper
  # see http://wikimatze.de/testing-helpers-in-padrino/
  subject(:developers_helper) do
    class DevelopersHelperClass
      include RestfulApi::App::DevelopersHelper
    end

    DevelopersHelperClass.new
  end

  describe '#render_errors' do
    let(:developer) { build :developer, :invalid }

    before do
      developer.save
    end

    it 'returns a json with developer\'s errors' do
      response = developers_helper.render_errors developer
      expected_response = {"errors": developer.errors}.to_json

      expect(response).to eq expected_response
    end
  end

end
