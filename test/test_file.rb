require File.dirname(__FILE__) + '/../lib/tweettening'
require 'test/unit'

class TestFile < Test::Unit::TestCase
  def setup
    @file = mp3(File.dirname(__FILE__) + '/../samples/Fur-Elise.mp3')
  end
  
  def test_valid_file
    assert @file.valid?
  end
  
  def test_play
    assert_equal @file.play, "tweettening ♫ Ludwig van Beethoven - Fur Elise"
  end
  
  def test_invalid_mp3_file
    file = mp3(['jingle.mp3', 'jerk.mp3'])
    assert !file.valid?
    
    file = mp3('Fur.elise')
    assert !file.valid?
  end
  
  def mp3(*file)
    MP3.new(file)
  end
end
