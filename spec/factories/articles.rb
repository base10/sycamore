FactoryBot.define do
  factory :article do
    slug { "slug" }
    title { "Title" }
    summary { "Summary of the article" }
    body { "Sample article text" }
    user
    site
  end
end
