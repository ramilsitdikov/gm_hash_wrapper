class StrictHashWrapper < HashWrapper
  def key?(key)
    @body.has_key?(key)
  end

  def method_missing method, *args, &block
    if @body.has_key?(method)
      if @body[meth].kind_of?(Hash)
        return StrictHashWrapper.new(@body[method])
      elsif @body[method].kind_of?(Array)
        return @body[method].map do |x|
          if x.kind_of?(Hash)
            StrictHashWrapper.new(x)
          else
            x
          end
        end
      else
        return @body[method]
      end
    else
      raise("undefined method '#{method}' for #{body}")
    end
  end

end
