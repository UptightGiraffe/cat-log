# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# disable adding div.field_with_error
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  html_tag.html_safe
end
