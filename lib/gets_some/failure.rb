module GetsSome
  module Failure
    def normal_failure(method, input)
      puts "#{input} is not a valid #{method.split('_').last}. Try again"
      self.send(method)
    end

    def strict_failure(method, input)
      raise ArgumentError, "#{input} is not a vald #{method.split('_').last}"
    end

    def loose_failure(method, input)
      case method
      when 'gets_integer' then input.to_i
      when 'gets_float' then input.to_f
      when 'gets_number' then input.to_f
      else
        normal_failure(method, input)
      end
    end

    if defined?(STRICT)
      alias_method :failure, :strict_failure
    elsif defined?(LOOSE)
      alias_method :failure, :loose_failure
    else
      alias_method :failure, :normal_failure
    end
  end
end
