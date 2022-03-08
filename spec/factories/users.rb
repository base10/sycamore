FactoryBot.define do
  factory :user do
    sequence(:email, 100) { |n| "user#{n}@example.com" }
    sequence(:name, 100) { |n| "User #{n}" }
    admin { false }
    password { "a-secure-password" }

    trait :is_admin do
      admin { true }
    end
  end
end
