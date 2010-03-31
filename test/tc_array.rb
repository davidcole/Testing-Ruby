$:.unshift File.join( File.dirname( __FILE__ ), '..', 'lib' )

require 'test/unit'

class ArrayTest < Test::Unit::TestCase

  def test_length
    a = [ 1, 2, 3, 4 ]
    assert_equal( 4, a.length )
  end

end

