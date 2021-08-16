class PicksUpdateWorker
  include Sidekiq::Worker
  sidekiq_options queue: :default

  def perform(match_question_id)
    match_question = MatchQuestion.find(match_question_id)
    if match_question
      winner_picks = Pick.where(match_question_id: match_question_id, team_id: match_question.winner_id)
      winner_picks.update_all(result: true)
      loser_picks = Pick.where(match_question_id: match_question_id).where.not(team_id: match_question.winner_id)
      loser_picks.update_all(result: false)
      MatchUpdateWorker.perform_async(match_question.match.id)
    end
  end
end
