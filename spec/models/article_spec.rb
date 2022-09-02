require "rails_helper"

RSpec.describe Article, type: :model do
  subject { FactoryBot.create(:article) }

  describe "validations" do
    it { should validate_presence_of(:slug) }
    it { should validate_length_of(:slug).is_at_most(255)}

    it { should validate_presence_of(:body) }
    it { should validate_uniqueness_of(:slug).case_insensitive }
    it { should validate_presence_of(:published_on) }
  end

  describe "associations" do
    it { belong_to(:site) }
    it { belong_to(:user) }
  end

  describe "scopes" do
    describe "is_published" do
      it "includes articles where published is true" do
        article = FactoryBot.create(:published_article)

        expect(Article.is_published).to include(article)
      end

      it "does not include articles where published is false" do
        article = FactoryBot.create(:unpublished_article)

        expect(Article.is_published).not_to include(article)
      end
    end

    describe "is_unpublished" do
      it "does not include articles where published is true" do
        article = FactoryBot.create(:published_article)

        expect(Article.is_unpublished).not_to include(article)
      end

      it "includes articles where published is false" do
        article = FactoryBot.create(:unpublished_article)

        expect(Article.is_unpublished).to include(article)
      end
    end

    describe "is_public" do
      it "includes articles where public is true" do
        article = FactoryBot.create(:public_article)

        expect(Article.is_public).to include(article)
      end

      it "does not include articles where public is false" do
        article = FactoryBot.create(:private_article)

        expect(Article.is_public).not_to include(article)
      end
    end

    describe "is_private" do
      it "does not include articles where public is true" do
        article = FactoryBot.create(:public_article)

        expect(Article.is_private).not_to include(article)
      end

      it "includes articles where public is false" do
        article = FactoryBot.create(:private_article)

        expect(Article.is_private).to include(article)
      end
    end

    describe "live" do
      it "includes articles that are published and public" do
        article = FactoryBot.create(:live_article)

        expect(Article.live).to include(article)
      end

      it "does not include articles that are private" do
        article = FactoryBot.create(:private_article)

        expect(Article.live).not_to include(article)
      end

      it "does not include articles that are unpublished" do
        article = FactoryBot.create(:unpublished_article)

        expect(Article.live).not_to include(article)
      end
    end
  end
end
