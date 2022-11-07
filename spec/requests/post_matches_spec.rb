require 'rails_helper'

RSpec.describe 'Matches', type: :request do
  describe 'POST /create' do
    context 'with valid parameters' do
      let!(:my_match) { FactoryBot.create(:match) }
      before do
        post '/api/v1/matches', params:
                          { match: {
                            match_date: my_match.match_date,
                            home_team_id: my_match.home_team_id,
                            visitor_team_id: my_match.visitor_team_id
                          } }
      end

      it 'returns the match_date' do
        expect(json['match_date']).to eq(my_match.match_date)
      end

      it 'returns the home_team_id' do
        expect(json['home_team_id']).to eq(my_match.home_team_id)
      end

      it 'returns the visitor_team_id' do
        expect(json['visitor_team_id']).to eq(my_match.visitor_team_id)
      end

      it 'returns a created status' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      before do
        post '/api/v1/matches', params:
                          { match: {
                            match_date: '',
                            home_team_id: '',
                            visitor_team_id: ''
                          } }
      end

      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end