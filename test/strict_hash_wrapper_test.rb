require 'test_helper'

class StrictHashWrapperTest < Minitest::Test
  def test_should_respond_to_methods
    hash = { key1: "value1", "key2": "value2" }
    strict_wrapped_hash = StrictHashWrapper.new(hash)
    assert strict_wrapped_hash.respond_to?('set_data')
    assert strict_wrapped_hash.respond_to?('to_h')
    assert strict_wrapped_hash.respond_to?('as_json')
    assert strict_wrapped_hash.respond_to?('to_json')
    assert strict_wrapped_hash.respond_to?('nil?')
    assert strict_wrapped_hash.respond_to?('present?')
    assert strict_wrapped_hash.respond_to?('each')
    assert strict_wrapped_hash.respond_to?('key?')
  end
end
