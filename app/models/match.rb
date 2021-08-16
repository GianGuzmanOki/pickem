class Match < ApplicationRecord
  belongs_to :home_team, class_name: 'Team'
  belongs_to :away_team, class_name: 'Team'
  has_many :match_questions

  enum status: [:pending, :finished]

  validate :different_teams

  after_create :add_default_question

  private

  def different_teams
    errors.add(:teams, 'cant be the same') if home_team == away_team
  end

  def add_default_question
    match_questions.create(question: 'Who is going to win?')
  end
end
