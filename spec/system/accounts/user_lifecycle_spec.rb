require "rails_helper"

RSpec.describe "User Lifecycle", type: :system do
  before(:example) do
    driven_by(:rack_test)
  end

  feature "Guest visits site" do
    it "shows a log in button" do
      visit "/"

      within(:xpath, "//nav[@id='user_actions']") do
        expect(page).to have_link(I18n.t("devise.actions.login"))
      end
    end

    it "shows a sign up button" do
      visit "/"

      within(:xpath, "//nav[@id='user_actions']") do
        expect(page).to have_link(I18n.t("devise.actions.sign_up"))
      end
    end

    it "shows default language on the home page" do
      visit "/"

      expect(page).to have_text("Devise things here")
    end
  end

  feature "Guest creates account" do
    it "allows a user to create an account and logs the user in" do
      user_attributes = prepare_user_attributes

      visit "/"

      within(:xpath, "//nav[@id='user_actions']") do
        click_link(I18n.t("devise.actions.sign_up"))
      end

      fill_form(
        :new_user,
        {
          name: user_attributes[:name],
          email: user_attributes[:email],
          password: user_attributes[:password],
          password_confirmation: user_attributes[:password]
        }
      )

      click_button(I18n.t("devise.actions.sign_up"))

      aggregate_failures "Signs we're now logged in" do
        within(:xpath, "//nav[@id='user_actions']") do
          expect(page).to have_text("👋 #{user_attributes[:name]}")
          expect(page).to have_link(I18n.t("devise.actions.logout"))
        end

        within(:xpath, "//section[@id='flashes']") do
          expect(page).to have_text(I18n.t("devise.registrations.signed_up"))
        end
      end
    end
  end

  feature "Returning user logs into the site" do
    it "shows a log in button" do
      visit "/"

      within(:xpath, "//nav[@id='user_actions']") do
        expect(page).to have_link(I18n.t("devise.actions.login"))
      end
    end

    it "allows the user to log in" do
      user = FactoryBot.create(:user)

      visit "/"

      within(:xpath, "//nav[@id='user_actions']") do
        click_link(I18n.t("devise.actions.login"))
      end

      fill_form(
        :new_user,
        {
          email: user.email,
          password: user.password
        }
      )

      click_button(I18n.t("devise.actions.login"))

      aggregate_failures "Signs we're now logged in" do
        within(:xpath, "//nav[@id='user_actions']") do
          expect(page).to have_text("👋 #{user.name}")
          expect(page).to have_link(I18n.t("devise.actions.logout"))
        end

        within(:xpath, "//section[@id='flashes']") do
          expect(page).to have_text(I18n.t("devise.sessions.signed_in"))
        end
      end
    end
  end

  feature "Logged in user logs out" do
    it "allows a user to log out" do
      user = FactoryBot.create(:user)
      login_as(user, scope: :user)

      visit "/"

      aggregate_failures "Signs we're now logged out" do
        within(:xpath, "//nav[@id='user_actions']") do
          click_link(I18n.t("devise.actions.logout"))
        end

        within(:xpath, "//section[@id='flashes']") do
          expect(page).to have_text(I18n.t("devise.sessions.signed_out"))
        end
      end
    end
  end

  feature "Returning user resets password"

  def prepare_user_attributes
    attributes_for(:user).slice(*sign_up_attributes)
  end

  def sign_up_attributes
    [:name, :email, :password]
  end
end
