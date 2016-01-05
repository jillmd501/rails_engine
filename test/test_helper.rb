ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/autorun'
require 'minitest/pride'
require 'simplecov'

require 'simplecov'
SimpleCov.start 'rails'


class ActiveSupport::TestCase
  def json_response
    JSON.parse(response.body)
  end
end
