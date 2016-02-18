require 'active_support/core_ext/hash/indifferent_access'
module GmHashWrapper
  class HashWrapper
    attr_reader :body

    def initialize(body)
      @body = ActiveSupport::HashWithIndifferentAccess.new(body)
    end

    def set_data(key, value)
      @body[key.to_s] = value
    end
    def to_h
      @body
    end

    def as_json(options = {})
      @body
    end

    def to_json
      @body.to_json
    end

    def nil?
      @body.keys.empty?
    end

    def present?
      @body.keys.any?
    end

    def each(&block)
      body.each &block
    end

    def method_missing meth, *args, &block
      if @body.has_key?(meth)
        if @body[meth].kind_of?(Hash)
          return HashWrapper.new(@body[meth])
        elsif @body[meth].kind_of?(Array)
          return @body[meth].map do |x|
            if x.kind_of?(Hash)
              HashWrapper.new(x)
            else
              x
            end
          end
        else
          return @body[meth]
        end
      end
      nil
    end

    def respond_to_missing?(meth, include_private = false)
      @body.has_key?(meth) || super
    end
  end
end
