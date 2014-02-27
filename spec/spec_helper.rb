require 'bundler/setup'
Bundler.setup

require 'gets_some'

module Helpers
  def stub_input(input)
    Kernel.stub(:gets).and_return(input);
  end
end

RSpec.configure do |conf|
  conf.include(Helpers)
end
