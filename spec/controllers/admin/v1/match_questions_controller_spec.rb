require 'rails_helper'

RSpec.describe Admin::V1::MatchQuestionsController, type: :controller do

  let(:admin_user) { FactoryBot.create :active_admin_user }
  let(:team_one) { FactoryBot.create :team }
  let(:team_two) { FactoryBot.create :team }
  let!(:match) { FactoryBot.create :match, home_team: team_one, away_team: team_two }

  describe "POST mark_winner" do
    before do
      ApiV1AdminController.any_instance.stub(:session_admin_user).and_return(admin_user)
    end

    it 'returns http success' do
      post :mark_winner, params: { "winner" => team_one.id, "match_question_id" => match.default_question.id }
      expect(response).to have_http_status(:success)
    end

    it 'updates the match question' do
      post :mark_winner, params: { "winner" => team_one.id, "match_question_id" => match.default_question.id }
      expect(match.default_question.winner_id).to eq team_one.id
    end

    it 'triggers PicksUpdateWorker' do
      post :mark_winner, params: { "winner" => team_one.id, "match_question_id" => match.default_question.id }
      expect(PicksUpdateWorker).to have_enqueued_sidekiq_job(match.default_question.id)
    end
  end

end
