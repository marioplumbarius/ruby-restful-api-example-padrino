shared_examples_for :application_json_content_type do
  it 'returns application/json content-type' do
    expect(last_response.content_type).to eq 'application/json'
  end
end
