require 'spec_helper'

describe 'strict failure' do
  before(:all) do
    require_relative '../lib/gets_some/strict'
  end

  context 'strict flag' do
    it 'should be set to true if strict.rb is required' do
      expect(GetsSome::STRICT).to eql(true)
    end
  end

  context 'strict gets_integer' do
    it 'should raise an error if not a valid integer' do
      stub_input('a')
      expect{Kernel.gets_integer}.to raise_error(ArgumentError)
    end
  end
  
  context 'strict gets_float' do
    it 'should raise an error if not a valid float' do
      stub_input('a')
      expect{Kernel.gets_float}.to raise_error(ArgumentError)
    end
  end
  
  context 'strict gets_number' do
    it 'should raise an error if not a valid number' do
      stub_input('a')
      expect{Kernel.gets_number}.to raise_error(ArgumentError)
    end
  end
end
