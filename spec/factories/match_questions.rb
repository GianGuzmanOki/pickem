FactoryBot.define do
  factory :match_question do
    association :match
    question { 'Who is going to score more points?' }
    winner { nil }
    default_question { false }
  end
end
