 require 'rails_helper'

RSpec.describe Article, type: :model do
  subject { FactoryBot.create(:article) }

  describe "validations" do
    it { should validate_presence_of(:slug) }
    it { should validate_length_of(:slug)}

    it { should validate_presence_of(:body) }
    it { should validate_uniqueness_of(:slug).case_insensitive }
    it { should validate_presence_of(:published_on) }
  end

  describe "defaults" do
  end

  describe "associations" do
    it { belong_to(:site) }
    it { belong_to(:user) }
  end
end
