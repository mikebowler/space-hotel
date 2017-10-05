class OptionValue < ActiveRecord::Base
  belongs_to :shared_session
  belongs_to :option

  # return the rich value held in the database, corresponding to the type defined.
  # So booleans will be returned as true/false rather than 'Y' or 'N'
  def object
    if option.value_type == 'boolean'
      (value || option.default_value) == 'Y'
    else
      null
    end
  end
end
