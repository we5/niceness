Array.send  :include, We5::Extensions::Array
String.send :include, We5::Extensions::String
ActionView::Base.send :include, We5::Helpers::BrowserHelpers


# You should specify gem dependencies in your config/environment.rb: config.gem "rubyist-aasm"
#
if defined? AASM
else
  # message=%q(WARNING: We need AASM for the draftable concern)
  # puts message
  # Rails.logger.error message
end