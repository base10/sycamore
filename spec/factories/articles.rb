FactoryBot.define do
  factory :article do
    slug { "MyString" }
    title { "MyString" }
    summary { "MyText" }
    body { "MyText" }
    user { nil }
    site { nil }
  end
end
