module Input
  INTEGER_REGEX = /^\d+$/ 
  FLOAT_REGEX = /^\d+(.\d+)?$/
  def gets_integer
    input = gets
    if input =~ INTEGER_REGEX
      input.to_i
    else
      raise "#{input} is not a valid number"
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
    input = gets
    if input =~ FLOAT_REGEX
      input.to_f
    else
      raise "#{input} is not a valid float"
    end
  end

  def gets_number
    input = gets
    if input =~ INTEGER_REGEX
      input.to_i
    elsif input =~ FLOAT_REGEX
      input.to_f
    else
      raise "#{input} can't be converted to a number"
    end
  end

  def gets_math
    input = gets
    if input =~ /^[\d\+\/\*%\s-]+$/
      eval(input)
    else
      raise "Can't do math on #{input}"
    end
  end
end
