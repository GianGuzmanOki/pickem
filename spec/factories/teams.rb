FactoryBot.define do
  factory :team do
    sequence(:name) { |n| "Generic Team #{n}" }
  end
end
