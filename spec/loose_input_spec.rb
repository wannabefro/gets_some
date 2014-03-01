require 'spec_helper'

describe 'loose failure' do
  before(:all) do
    require_relative '../lib/gets_some/loose'
  end

  context 'strict flag' do
    it 'should be set to true if strict.rb is required' do
      expect(GetsSome::LOOSE).to eql(true)
    end
  end

  context 'loose failure to integer' do
    it 'should convert the string to an integer' do
      stub_input('1cb')
      expect(Kernel.gets_integer).to eql(1)
      stub_input('abc')
      expect(Kernel.gets_integer).to eql(0)
    end
  end
end
