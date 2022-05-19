require 'rails_helper'

RSpec.describe "articles/new", type: :view do
  before(:each) do
    assign(:article, Article.new(
      slug: "MyString",
      title: "MyString",
      summary: "MyText",
      body: "MyText",
      user: nil,
      site: nil
    ))
  end

  it "renders new article form" do
    render

    assert_select "form[action=?][method=?]", articles_path, "post" do

      assert_select "input[name=?]", "article[slug]"

      assert_select "input[name=?]", "article[title]"

      assert_select "textarea[name=?]", "article[summary]"

      assert_select "textarea[name=?]", "article[body]"

      assert_select "input[name=?]", "article[user_id]"

      assert_select "input[name=?]", "article[site_id]"
    end
  end
end
