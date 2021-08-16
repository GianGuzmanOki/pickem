class MatchUpdateWorker
  include Sidekiq::Worker
  sidekiq_options queue: :default

  def perform(match_id)
    match = Match.find(match_id)
    if match && match.not_solved_questions.empty?
      match.finished!
    end
  end
end
