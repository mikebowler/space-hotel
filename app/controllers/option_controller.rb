#
class OptionController < ApplicationController
  before_action :admin_only

  def index
    all_options = Option.all
    values = OptionValue.find_by_shared_session_id @shared_session.id

    @data = all_options.collect do |option|
      [option, values.nil? ? nil : values.find { |v| v.option_id = option.id }]
    end
  end
end
