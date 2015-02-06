ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def assert_messages *messages
    assert_equal messages, flash[:messages]
  end

  def assert_no_messages
    assert_messages([])
  end

  def set_option_value session_id, key, value
    option = Option.find_by :key => key.to_s
    option_value = OptionValue.find_by(
      :shared_session_id => session_id, :option_id => option.id
    )
    if value.nil?
      option_value.delete
    else
      option_value.value = value
      option_value.save!
    end
  end

end
