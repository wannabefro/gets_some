module GetsSome
  module Failure
    def normal_failure(method, input)
      puts "#{input} is not a valid #{method.split('_').last}. Try again"
      self.send(method)
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
