require 'rails_helper'
r = Random.new

RSpec.describe "Matches", type: :request do
  describe "GET /matches" do
    it "is not valid GET matches without sign in" do
      get 'http://127.0.0.1:3000/matches'
      expect(response).to_not have_http_status(200)
    end
  end

  describe "POST /matches" do
    it "is not valid POST matches without sign in" do
      headers = { 'ACCEPT' => 'application/json' }
      post 'http://127.0.0.1:3000/matches', :params => {
        :match => { match_date: Faker::Date.between(from: 14.days.ago, to: Date.today), home_team_id: r.rand(0..8), visitor_team_id: r.rand(9..16) }
      }, :headers => headers
      expect(response).to_not have_http_status(200)
    end
  end
end
