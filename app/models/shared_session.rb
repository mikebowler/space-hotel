class SharedSession < ActiveRecord::Base
  has_many :option_value

  def to_s
    "#{id}-#{alpha_code}"
  end
end
