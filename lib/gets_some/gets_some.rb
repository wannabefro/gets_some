require "gets_some/input"

module Kernel
  include Input
end

class Object
  include Kernel
end
