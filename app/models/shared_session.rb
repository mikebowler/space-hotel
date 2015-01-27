class SharedSession < ActiveRecord::Base
  has_many :option_value

  def to_s
    "#{self.id}-#{self.alpha_code}"
  end
end
