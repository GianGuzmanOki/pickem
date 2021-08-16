class Pick < ApplicationRecord
  belongs_to :match_question
  belongs_to :user
  belongs_to :team
end
