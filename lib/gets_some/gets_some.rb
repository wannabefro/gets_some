require "gets_some/failure"
require "gets_some/input"

module Kernel
  include GetsSome::Input
end

class Object
  include Kernel
end
