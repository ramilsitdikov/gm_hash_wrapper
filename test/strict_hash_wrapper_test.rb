require 'test_helper'

class StrictHashWrapperTest < Minitest::Test
  def test_should_respond_to_methods
    hash = { key1: "value1", "key2": "value2" }
    strict_wrapped_hash = GmHashWrapper::StrictHashWrapper.new(hash)
    assert strict_wrapped_hash.respond_to?('set_data')
    assert strict_wrapped_hash.respond_to?('to_h')
    assert strict_wrapped_hash.respond_to?('as_json')
    assert strict_wrapped_hash.respond_to?('nil?')
    assert strict_wrapped_hash.respond_to?('present?')
    assert strict_wrapped_hash.respond_to?('each')
    assert strict_wrapped_hash.respond_to?('key?')
  end

  def test_functionality
    hash = { key1: "value1", "key2": "value2" }
    strict_wrapped_hash = GmHashWrapper::StrictHashWrapper.new(hash)
    strict_wrapped_hash.set_data('key3', 'value3')
    assert_equal strict_wrapped_hash.key3 , 'value3'
    assert strict_wrapped_hash.to_h
    assert strict_wrapped_hash.as_json
    assert strict_wrapped_hash.present?
    assert strict_wrapped_hash.key?('key1')
    assert strict_wrapped_hash.key?(:key1)
    assert !strict_wrapped_hash.key?('key10')
    assert !strict_wrapped_hash.key?(:key10)

    assert_raises do
      strict_wrapped_hash.wrong
    end
    hash = {}
    strict_wrapped_hash = GmHashWrapper::StrictHashWrapper.new(hash)
    assert strict_wrapped_hash.nil?
  end
end
