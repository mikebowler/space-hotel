class SharedSession < ActiveRecord::Base
  has_many :option_value
end
