module Tweettening
  class Player
    def initialize(file)
      klass = Mp3
      @file = klass.new(file)
    end

    def play!
      @file.play
    end
  end
end
