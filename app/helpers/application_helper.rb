module ApplicationHelper
  OPTIONS = [
    :autolink,
    :fenced_code_blocks,
    :hard_wrap,
    :highlight,
    :prettify,
    :safe_links_only,
    :underline
  ].freeze

  def markdown(text)
    output = Markdown.new(text, *OPTIONS)

    output.to_html.html_safe
  end
end
