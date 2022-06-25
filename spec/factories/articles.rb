FactoryBot.define do
  factory :article do
    slug { "slug" }
    title { "Title" }
    summary { "Summary of the article" }
    body { "Sample article text" }

    published { true }
    public { true }

    published_on { Time.now.to_date }

    user
    site
  end
end
