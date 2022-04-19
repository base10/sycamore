FactoryBot.define do
  factory :site do
    name { "My Website" }
    url { "https://www.example.com/" }
    description { "Descriptive text about the website" }
  end
end
