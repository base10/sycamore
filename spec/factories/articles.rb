FactoryBot.define do
  factory :article, aliases: [:live_article, :public_article, :published_article] do
    slug { "slug" }
    title { "Title" }
    summary { "Summary of the article" }
    body { "Sample article text" }

    published { true }
    public { true }

    published_on { Time.now.to_date }

    user
    site

    factory :unpublished_article do
      published { false }
    end

    factory :private_article do
      public { false }
    end
  end
end
