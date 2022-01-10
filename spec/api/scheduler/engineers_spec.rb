require 'rails_helper'

RSpec.describe 'GET /api/v1/engineers' do
  it 'return a list of all engineers' do
    create_list(:engineer, 4)

    get '/api/v1/engineers'

    expect(json_body.count).to eq(4)
  end
end
