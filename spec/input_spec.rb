require 'spec_helper'

describe "gets_integer" do
  it "should convert the input to an integer" do
    stub_input("2\n")
    expect(Kernel.gets_integer).to eql(2)
    stub_input("2345\n")
    expect(Kernel.gets_integer).to eql(2345)
  end
  it "should raise an error if not a valid integer" do
    stub_input("abc\n")
    expect{Kernel.gets_integer}.to raise_error(RuntimeError)
    stub_input("1bc\n")
    expect{Kernel.gets_integer}.to raise_error(RuntimeError)
  end
end

describe "gets_array" do
  it "should convert a comma separated list to an array" do
    stub_input("1,2,3")
    expect(Kernel.gets_array).to eql(['1', '2', '3'])
    stub_input("apple, banana, orange")
    expect(Kernel.gets_array).to eql(%w(apple banana orange))
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
