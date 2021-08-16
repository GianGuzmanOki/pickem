FactoryBot.define do
  factory :team do
    sequence(:name) { |n| "Generic Category #{n}" }
  end
end
