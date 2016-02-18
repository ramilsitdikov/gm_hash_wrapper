require 'test_helper'

class HashWrapperTest < Minitest::Test
  def test_should_respond_to_methods
    hash = { key1: "value1", "key2": "value2" }
    wrapped_hash = GmHashWrapper::HashWrapper.new(hash)
    assert wrapped_hash.respond_to?('set_data')
    assert wrapped_hash.respond_to?('to_h')
    assert wrapped_hash.respond_to?('as_json')
    assert wrapped_hash.respond_to?('nil?')
    assert wrapped_hash.respond_to?('present?')
    assert wrapped_hash.respond_to?('each')
  end

  def test_functionality
    hash = { key1: "value1", "key2": "value2" }
    wrapped_hash = GmHashWrapper::HashWrapper.new(hash)
    wrapped_hash.set_data('key3', 'value3')
    assert_equal wrapped_hash.key3 , 'value3'
    assert wrapped_hash.to_h
    assert wrapped_hash.as_json
    assert wrapped_hash.present?

    hash = {}
    wrapped_hash = GmHashWrapper::HashWrapper.new(hash)
    assert wrapped_hash.nil?
  end
end
