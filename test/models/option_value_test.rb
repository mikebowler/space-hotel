require 'test_helper'

class OptionValueTest < ActiveSupport::TestCase
  test 'when value is Y' do
    value = OptionValue.includes(:option).first
    value.value = 'Y'
    assert_same value.object, true
  end

  test 'when value is N' do
    value = OptionValue.includes(:option).first
    value.value = 'F'
    assert_same value.object, false
  end

  test 'when value is nil and the default is Y' do
    value = OptionValue.includes(:option).first
    value.value = nil
    value.option.default_value = 'Y'
    assert_same value.object, true
  end

  test 'when value is nil and the default is N' do
    value = OptionValue.includes(:option).first
    value.value = nil
    value.option.default_value = 'F'
    assert_same value.object, false
  end
end
