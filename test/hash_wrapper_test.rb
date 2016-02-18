require 'test_helper'

class HashWrapperTest < Minitest::Test
  def test_should_respond_to_methods
    hash = {}
    wrapped_hash = HashWrapper.new(hash)
    assert wrapped_hash.respond_to?('set_data')
    assert wrapped_hash.respond_to?('to_h')
    assert wrapped_hash.respond_to?('as_json')
    assert wrapped_hash.respond_to?('to_json')
    assert wrapped_hash.respond_to?('nil?')
    assert wrapped_hash.respond_to?('present?')
    assert wrapped_hash.respond_to?('each')
  end
end
