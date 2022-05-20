require "rails_helper"

RSpec.describe Site, type: :model do
  subject { FactoryBot.create(:site) }

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :url }
    it { should validate_uniqueness_of(:name).case_insensitive }
    it { should validate_uniqueness_of(:url).case_insensitive }
  end

  describe "associations" do
    it "has many articles" do
      expect(subject).to have_many(:articles)
    end
  end
end
