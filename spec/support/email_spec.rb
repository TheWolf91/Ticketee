require "email_spec"
require "email_spec/rspec"

RSpec.configuration do |config|
  config.include EmailSpec::Helpers
  config.include EmailSpec::Matchers
end