ENV["RAILS_ENV"] = "test"


require File.expand_path("../../config/environment", __FILE__)

require "rspec/rails"
require "spec_helper"

RSpec.configure do |config|
  config.render_views

  config.include Rails.application.routes.url_helpers, type: :controller
end
