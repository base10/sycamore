require "rails_helper"

RSpec.describe User, type: :model do
  subject { FactoryBot.create(:user) }

  describe "validations" do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of :encrypted_password }
  end

  describe "associations" do
    it "has many articles" do
      expect(subject).to have_many(:articles)
    end
  end

  describe "behaviors" do
    it { should be_logged_in }

    context "regular user" do
      it { should_not be_admin }
    end

    context "admin" do
      subject { FactoryBot.build(:user, :is_admin) }

      it { should be_admin }
    end
  end
end
