module MarkdownHandler
  def self.erb
    @erb ||= ActionView::Template.registered_template_handler(:erb)
  end

  def self.call(template)
    compiled_source = erb.call(template)
    "MarkdownHandler.render_markdown(begin;#{compiled_source};end).html_safe"
  end

  def self.render_markdown(input)
    processor.render(input)
  end

  def self.processor
    @processor ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  end
end
