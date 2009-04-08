require File.expand_path(File.dirname(__FILE__) + '/test_helper')

class TestMp3 < Test::Unit::TestCase
  def setup
    @file = mp3(File.dirname(__FILE__) + '/../samples/Fur-Elise.mp3')
  end
  
  def test_invalid_mp3_file
    file = mp3(['jingle.mp3', 'jerk.mp3'])
    assert !file.valid?
    
    file = mp3('Fur.elise')
    assert !file.valid?
  end
  
  def test_play_mp3
    assert_equal "tweettening ♫ Ludwig van Beethoven - Fur Elise", @file.play
  end
end
