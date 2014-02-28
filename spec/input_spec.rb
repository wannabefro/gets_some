require 'spec_helper'

describe "gets_integer" do
  it "should convert the input to an integer" do
    stub_input("2\n")
    expect(Kernel.gets_integer).to eql(2)
    stub_input("2345\n")
    expect(Kernel.gets_integer).to eql(2345)
  end
  it "should raise an error if not a valid integer" do
    stub_input("abc\n", '2')
    printed = capture_stdout do
      Kernel.gets_integer
    end
    expect(printed).to eq("abc is not a valid integer. Try again\n")
    stub_input("1bc\n", '2')
    printed = capture_stdout do
      Kernel.gets_integer
    end
    expect(printed).to eql("1bc is not a valid integer. Try again\n")
  end
end

describe "gets_array" do
  it "should convert a comma separated list to an array" do
    stub_input("1,2,3")
    expect(Kernel.gets_array).to eql(['1', '2', '3'])
    stub_input("apple, banana, orange")
    expect(Kernel.gets_array).to eql(%w(apple banana orange))
    stub_input("Hello world, goodbye, I love dogecoin")
    expect(Kernel.gets_array).to eql(["Hello world", "goodbye", "I love dogecoin"])
  end
  it "should convert a pipe seperated list to an array" do
    stub_input("1|2|3")
    expect(Kernel.gets_array).to eql(['1', '2', '3'])
  end
  it "should convert a white space seperated list to an array" do
    stub_input("1 2 3")
    expect(Kernel.gets_array).to eql(['1', '2', '3'])
    stub_input("hello world goodbye")
    expect(Kernel.gets_array).to eql(['hello', 'world', 'goodbye'])
  end
end

describe "gets_float" do
  it "should convert a decimal seperated number to a float" do
    stub_input("1.1")
    expect(Kernel.gets_float).to eql(1.1)
    stub_input("1")
    expect(Kernel.gets_float).to eql(1.0)
  end
  it "should raise an error if not a valid float" do
    stub_input("1.3.2", '2.1')
    printed = capture_stdout do
      Kernel.gets_float
    end
    expect(printed).to eq("1.3.2 is not a valid float. Try again\n")
    stub_input("abc", '2.1')
    printed = capture_stdout do
      Kernel.gets_float
    end
    expect(printed).to eq("abc is not a valid float. Try again\n")
  end
end

describe "gets_math" do
  it "should evaluate the math in the input" do
    stub_input("1 + 1")
    expect(Kernel.gets_math).to eql(2)
  end
  it "should not value invalid math" do
    stub_input("puts 'hello'")
    expect{Kernel.gets_math}.to raise_error
  end
end

describe "gets_number" do
  it "should return an integer if the input is an integer" do
    stub_input("1")
    expect(Kernel.gets_number).to eql(1)
  end
  it "should be a float if the input is a float" do
    stub_input("1.1")
    expect(Kernel.gets_number).to eql(1.1)
  end
  it "should return an error if neither a float or an integer is given" do
    stub_input("abc", "1")
    printed = capture_stdout do
      Kernel.gets_number
    end
    expect(printed).to eq("abc is not a valid number. Try again\n")
  end
end
