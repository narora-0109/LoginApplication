# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
LoginApplication::Application.initialize!

ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  "<div class=\"errors_field\">#{html_tag}</div>".html_safe
end