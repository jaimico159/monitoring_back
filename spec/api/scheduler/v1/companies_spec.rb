require 'rails_helper'

RSpec.describe Scheduler::V1::Companies do
  describe 'GET /api/v1/companies' do
    it 'return a list of all companies' do
      create_list(:company, 4)

      get '/api/v1/companies'

      expect(json_body.count).to eq(4)
    end
  end

  describe 'GET /:id/contracts' do
    it 'returns a json with the company contracts' do
      company_with_contracts(contracts_count: 10)
      company = Company.last
      get "/api/v1/companies/#{company.id}/contracts"

      expect(json_body['contracts'].size).to eq(10)
    end
  end
end
