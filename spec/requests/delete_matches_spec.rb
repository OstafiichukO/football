require 'rails_helper'

RSpec.describe 'Matches', type: :request do
  describe "DELETE /destroy" do
    let!(:match) { FactoryBot.create(:match) }

    before do
      delete "/api/v1/matches/#{match.id}"
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end