class OptionValue < ActiveRecord::Base
  belongs_to :shared_session
  has_one :option
end
