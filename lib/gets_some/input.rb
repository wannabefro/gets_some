module Input
  def gets_integer
    input = gets
    if input =~ /^\d+$/ 
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
end
