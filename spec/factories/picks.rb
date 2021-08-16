FactoryBot.define do
  factory :pick do
    association :match_question
    association :user
    association :team
  end
end
