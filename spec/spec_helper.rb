require 'bundler/setup'
require 'stringio'
Bundler.setup

require 'gets_some'

module Helpers
  def stub_input(input, optional_input = nil)
    Kernel.stub(:gets).and_return(input, optional_input)
  end

  def capture_stdout(&blk)
    old = $stdout
    $stdout = fake = StringIO.new
    blk.call
    fake.string
  ensure
    $stdout = old
  end

  def capture_stderr(&blk)
    old = $stderr
    $stderr = fake = StringIO.new
    blk.call
    fake.string
  ensure
    $stderr = old
  end
end

RSpec.configure do |conf|
  conf.include(Helpers)
end
