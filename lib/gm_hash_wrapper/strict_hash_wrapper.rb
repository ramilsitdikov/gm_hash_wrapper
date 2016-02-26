module GmHashWrapper
  class StrictHashWrapper < HashWrapper
    def key?(key)
      @body.has_key?(key)
    end

    def method_missing meth, *args, &block
      if @body.has_key?(meth)
        if @body[meth].kind_of?(Hash)
          return StrictHashWrapper.new(@body[meth])
        elsif @body[meth].kind_of?(Array)
          return @body[meth].map do |x|
            if x.kind_of?(Hash)
              StrictHashWrapper.new(x)
            else
              x
            end
          end
        else
          return @body[meth]
        end
      else
        raise("undefined method \'#{meth}\' for #{body}")
      end
    end

  end
end
