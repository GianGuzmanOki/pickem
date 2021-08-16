FactoryBot.define do
  factory :active_admin_user, class: 'User' do
    sequence(:email) { |n| "generic-admin-#{n}@example.com" }
    password { '08h4f78hrc0ohw9f8heso' }
    password_confirmation { '08h4f78hrc0ohw9f8heso' }
  end
end
