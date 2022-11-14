require 'rails_helper'
r = Random.new

RSpec.describe "Api::V1::ApplicationApiController", type: :request do
  describe "GET /api/v1/get_token" do
    it "is valid GET get_token.json" do
      headers = { 'ACCEPT' => 'application/json' }
      get 'http://127.0.0.1:3000/api/v1/get_token.json', :params => { "user": { "email": "test@test.test", "password": "test" }}, :headers => headers
      expect(response).to have_http_status(404)
    end
  end
end
