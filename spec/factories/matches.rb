FactoryBot.define do
  factory :match do
    association :home_team, factory: :team
    association :away_team, factory: :team
    game_date { Date.today }
    status { 0 }
  end
end
