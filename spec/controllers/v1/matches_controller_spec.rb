require 'rails_helper'

RSpec.describe V1::MatchesController, type: :controller do

  let(:user) { FactoryBot.create :user }
  before { sign_in user }

  let(:team_one) { FactoryBot.create :team }
  let(:team_two) { FactoryBot.create :team }
  let(:team_three) { FactoryBot.create :team }
  let!(:match) { FactoryBot.create :match, home_team: team_one, away_team: team_two }
  let!(:match_two) { FactoryBot.create :match, home_team: team_one, away_team: team_three }

  describe "GET index" do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
    it 'assigns the match' do
      get :index
      expect(assigns(:matches)).to include(match)
    end
    it 'json has correct response structure' do
      get :index
      parsed_body = JSON.parse(response.body)
      expect(parsed_body.keys).to contain_exactly('matches', 'meta')
      expect(parsed_body['matches'].count).to eq 2
      expect(parsed_body['matches'][0].keys).to contain_exactly('away_team', 'away_team_id', 'default_question', 'default_question_value', 'game_date', 'home_team', 'home_team_id', 'status')
      expect(parsed_body['matches'][0]['away_team']).to eq team_two.name
      expect(parsed_body['meta'].keys).to contain_exactly('current_page', 'next_page', 'prev_page', 'total_pages', 'total_count')
    end
  end

end
