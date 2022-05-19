require 'rails_helper'

RSpec.describe "articles/edit", type: :view do
  before(:each) do
    @article = assign(:article, Article.create!(
      slug: "MyString",
      title: "MyString",
      summary: "MyText",
      body: "MyText",
      user: nil,
      site: nil
    ))
  end

  it "renders the edit article form" do
    render

    assert_select "form[action=?][method=?]", article_path(@article), "post" do

      assert_select "input[name=?]", "article[slug]"

      assert_select "input[name=?]", "article[title]"

      assert_select "textarea[name=?]", "article[summary]"

      assert_select "textarea[name=?]", "article[body]"

      assert_select "input[name=?]", "article[user_id]"

      assert_select "input[name=?]", "article[site_id]"
    end
  end
end
