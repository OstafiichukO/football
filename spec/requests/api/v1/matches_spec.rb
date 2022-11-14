require 'rails_helper'
r = Random.new

RSpec.describe "Api::V1::MatchesController", type: :request do
  before(:each) do
    
  end
  describe "GET /api/v1/matches" do
    it "is valid GET matches.json" do
      headers = { 'ACCEPT' => 'application/json' }
      get 'http://127.0.0.1:3000/api/v1/matches.json', :headers => headers
      expect(response).to have_http_status(200)
      # i can expect specific response
    end
    it "is valid GET matches.xml" do
      headers = { 'ACCEPT' => 'application/xml' }
      get 'http://127.0.0.1:3000/api/v1/matches.xml', :headers => headers
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /api/v1/matches" do
    it "is valid POST matches.json" do
      headers = { 'ACCEPT' => 'application/json' }
      post 'http://127.0.0.1:3000/api/v1/matches', :params => {
        :match => { match_date: Faker::Date.between(from: 14.days.ago, to: Date.today), home_team_id: r.rand(0..8), visitor_team_id: r.rand(9..16) }
      }, :headers => headers
      expect(response).to have_http_status(200)
    end
  end
end
