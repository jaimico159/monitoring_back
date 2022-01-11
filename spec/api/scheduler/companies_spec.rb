require 'rails_helper'

RSpec.describe 'GET /api/v1/companies' do
  it 'return a list of all companies' do
    create_list(:company, 4)

    get '/api/v1/companies'

    expect(json_body.count).to eq(4)
  end
end
