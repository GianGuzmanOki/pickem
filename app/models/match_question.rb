class MatchQuestion < ApplicationRecord
  belongs_to :match
  belongs_to :winner, class_name: 'Team', optional: true
  has_many :picks
end
