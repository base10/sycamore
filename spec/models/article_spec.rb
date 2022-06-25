 require 'rails_helper'

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
    describe "published"
    describe "unpublished"
    describe "open"
    describe "non_public"
    describe "live"
  end

  describe "defaults" do

  end
end
