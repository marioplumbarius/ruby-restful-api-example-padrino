require_relative './application_json_content_type'

shared_examples_for :successful_ok_response do
  it 'returns 200 status code' do
    expect(last_response.status).to eq 200
  end

  include_examples :application_json_content_type
end

shared_examples_for :successful_no_content_response do
  it 'returns 204 status code' do
    expect(last_response.status).to eq 204
  end

  it 'does not return a content-type' do
    expect(last_response.content_type).to be_blank
  end
end

shared_examples_for :successful_created_response do
  it 'returns 204 status code' do
    expect(last_response.status).to eq 201
  end

  include_examples :application_json_content_type
end

shared_examples_for :unsuccessful_unprocessable_entity_response do
  it 'returns 422 status code' do
    expect(last_response.status).to eq 422
  end

  it 'returns validation errors' do
    parsed_body = JSON.parse last_response.body
    expect(parsed_body['errors']).not_to be_empty
  end

  include_examples :application_json_content_type
end

shared_examples_for :unsuccessful_not_found_response do
  it 'returns 404 status code' do
    expect(last_response.status).to eq 404
  end

  include_examples :application_json_content_type
end

shared_examples_for :unsuccessful_bad_request_response do
  it 'returns 400 status code' do
    expect(last_response.status).to eq 400
  end

  include_examples :application_json_content_type
end
