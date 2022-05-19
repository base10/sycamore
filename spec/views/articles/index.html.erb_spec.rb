require 'rails_helper'

RSpec.describe "articles/index", type: :view do
  before(:each) do
    assign(:articles, [
      Article.create!(
        slug: "Slug",
        title: "Title",
        summary: "MyText",
        body: "MyText",
        user: nil,
        site: nil
      ),
      Article.create!(
        slug: "Slug",
        title: "Title",
        summary: "MyText",
        body: "MyText",
        user: nil,
        site: nil
      )
    ])
  end

  it "renders a list of articles" do
    render
    assert_select "tr>td", text: "Slug".to_s, count: 2
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
