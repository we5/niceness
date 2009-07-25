Array.send :include, We5::Extensions::Array

# You should specify gem dependencies in your config/environment.rb: config.gem "rubyist-aasm"
#
if defined? AASM
  ActiveRecord::Base.send :include, AASM
else
  message=%q(WARNING: We need AASM for the draftable concern)
  puts message
  Rails.logger.error message
end