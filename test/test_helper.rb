require 'test/unit'
require File.expand_path(File.dirname(__FILE__) + "/../lib/tweettening")

class Test::Unit::TestCase
  def mp3(*file)
    Tweettening::Mp3.new(file)
  end
end
