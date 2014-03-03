module GetsSome
  module Input
    include GetsSome::Failure

    INTEGER_REGEX = /^\d+$/
    FLOAT_REGEX = /^\d+(.\d+)?$/

    def gets_integer
      input = gets.chomp
      if input =~ INTEGER_REGEX
        input.to_i
      else
        failure(__method__.to_s, input)
      end
    end

    def gets_array
      input = gets.chomp
      if input =~ /,/
        seperator = ','
      elsif input =~ /\|/
        seperator = '|'
      end
      array = input.split(seperator)
      array.map!(&:strip)
    end

    def gets_float
      input = gets.chomp
      if input =~ FLOAT_REGEX
        input.to_f
      else
        failure(__method__.to_s, input)
      end
    end

    def gets_number
      input = gets.chomp
      if input =~ INTEGER_REGEX
        input.to_i
      elsif input =~ FLOAT_REGEX
        input.to_f
      else
        failure(__method__.to_s, input)
      end
    end

    def gets_multiple
      input = gets.chomp
      input.split(',')
    end

    def gets_math
      input = gets.chomp
      if input =~ /^[\d\+\/\*%\s-]+$/
        eval(input)
      else
        raise "Can't do math on #{input}"
      end
    end

  end
end
