class MatchSerializer < ActiveModel::Serializer
  attributes :home_team_id, :home_team, :away_team_id, :away_team, :game_date, :status, :default_question, :default_question_value

  def home_team
    object.home_team.name
  end

  def away_team
    object.away_team.name
  end

  def status
    object.status.humanize
  end

  def default_question
    object.default_question.question
  end

  def default_question_value
    object.default_question.id
  end
end
