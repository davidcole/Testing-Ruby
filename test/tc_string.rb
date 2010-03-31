#!/usr/bin/env ruby -w

$:.unshift File.join( File.dirname( __FILE__ ), '..', 'lib' )

require 'test/unit'

class StringTest < Test::Unit::TestCase
  
  def test_expression_copy
    assert_equal('Hello! Hello! Hello! ', "#{ 'Hello! ' * 3 }")
  end
  
  def test_is_string_class
    assert_equal( 'hello'.class, String )
  end
  
  def test_expression_concatination
    assert_equal( 'Hello, ' + 'World!', 'Hello, World!' )
  end
  
  def test_expression_append
    a = 'Hello, '
    a << 'World'
    a << 33
    assert_equal( a, 'Hello, World!' )
  end
  
  def test_expression_comparison
    assert_equal( 1, 'abcdef' <=> 'abcde' )
    assert_equal( 0, 'abcdef' <=> 'abcdef' )
    assert_equal( -1, 'abcdef' <=> 'abcdefg' )
    assert_equal( 1, 'abcdef' <=> 'ABCDEF' )
  end
  
  def test_expression_equality
    assert( true, 'abcdef' == 'abcdef' )
  end
  
  def test_expression_match
    assert_equal( 7, "cat o' 9 tails" =~ /\d/ )
    assert_nil( "cat o' 9 tails" =~ /rabbit/ )
  end
  
  def test_expression_element_reference
    a = 'Hello, World!'
    assert_equal( 101, a[1] )
    assert_equal( 'ell', a[ 1, 3 ] )
    assert_equal( 'ell', a[ 1..3 ] )
    assert_equal( 'el', a[ 1...3 ] )
    assert_equal( 'ld', a[ -3, 2 ] )
    assert_equal( 'rld', a[ -4..-2 ] )
    assert_equal( '', a[ -2..-4 ] )
    assert_equal( 'ell', a[ /[aeiou](.)\1/ ] )
    assert_equal( 'ell', a[ /[aeiou](.)\1/, 0 ] )
    assert_equal( 'l', a[ /[aeiou](.)\1/, 1 ] )
    assert_nil( a[ /[aeiou](.)\1/, 2 ] )
    assert_equal( 'Wor', a[ /(..)r/ ] )
    assert_equal( 'Wo', a[ /(..)r/, 1 ] )
    assert_equal( 'lo', a[ 'lo' ] )
    assert_nil( a[ 'bye' ] ) 
  end
  
  def test_expression_element_assignment
    a = 'Hello'
    a[ 2 ] = 95
    assert_equal( 'He_lo', a )
    a = 'Hello'
    a[ 2, 4 ] = 'xyz'
    assert_equal( 'Hexyz', a )
    a = 'Hello'
    a[ -4, 2 ] = 'xyz'
    assert_equal( 'Hxyzlo', a )
    a = 'Hello'
    a[ 2..4 ] = 'xyz'
    assert_equal( 'Hexyz', a )
    a = 'Hello'
    a[ -4..-2 ] = 'xyz'
    assert_equal( 'Hxyzo', a )
    a = 'Hello'
    a[ /[aeiou](.)\1(.)/ ] = 'xyz'
    assert_equal( 'Hxyz', a )
    a = 'Hello'
    a[ /[aeiou](.)\1(.)/, 1 ] = 'xyz'
    assert_equal( 'Hexyzlo', a )
    a = 'Hello'
    a[ /[aeiou](.)\1(.)/, 2 ] = 'xyz'
    assert_equal( 'Hellxyz', a )
    a = 'Hello'
    a[ 'l' ] = 'xyz'
    assert_equal( 'Hexyzlo', a )
    a = 'Hello'
    a[ 'll' ] = 'xyz'
    assert_equal( 'Hexyzo', a )
    a = 'Hello'
    a[ 2, 0 ] = 'xyz'
    assert_equal( 'Hexyzllo', a )
  end
  
  def test_method_capitalize
    assert_equal( 'hello'.capitalize, 'Hello' )
    assert_equal( 'HELLO'.capitalize, 'Hello' )
    assert_equal( '123abc'.capitalize, '123abc' )
    assert_equal( 'Hello'.capitalize, 'Hello' )
  end
  
  def test_method_capitalize!
    cap = 'hello'
    cap.capitalize!
    assert_equal( 'Hello', cap )
  end
  
  def test_method_casecmp
    assert_equal( 1, 'abcdef'.casecmp( 'abcde' ) )
    assert_equal( 0, 'abcdef'.casecmp( 'abcdef' ) )
    assert_equal( 0, 'aBcDeF'.casecmp( 'abcdef' ) )
    assert_equal( -1, 'abcdef'.casecmp( 'abcdefg' ) )
    assert_equal( 0, 'abcdef'.casecmp( 'ABCDEF' ) )
  end
  
  def test_method_center
    assert_equal( 'hello', 'hello'.center( 4 ) )
    assert_equal( '       hello        ', 'hello'.center( 20 ) )
    assert_equal( 'hello', 'hello'.center( 4, '_-^-' ) )
    assert_equal( '_-^-_-^hello_-^-_-^-', 'hello'.center( 20, '_-^-' ) )
    assert_equal( '-------hello--------', 'hello'.center( 20, '-' ) )
  end
  
  def test_method_chomp
    assert_equal( 'hello', 'hello'.chomp )
    assert_equal( 'hello', "hello\n".chomp )
    assert_equal( 'hello', "hello\r\n".chomp )
    assert_equal( "hello\n", "hello\n\r".chomp )
    assert_equal( 'hello', "hello\r".chomp )
    assert_equal( "hello \n there", "hello \n there".chomp )
    assert_equal( 'he', "hello".chomp( 'llo' ) )
  end
  
  def test_method_chomp!
    a = "hello\n"
    a.chomp!
    assert_equal( 'hello', a )
    a = 'hello'.chomp!
    assert_nil( a )
  end
  
  def test_method_chop
    assert_equal( 'string', "string\r\n".chop )
    assert_equal( "string\n", "string\n\r".chop )
    assert_equal( 'string', "string\n".chop )
    assert_equal( 'strin', 'string'.chop )
    assert_equal( '', 'x'.chop )
    assert_equal( '', 'x'.chop.chop )
  end
  
  def test_method_chop!
    a = "string\n"
    a.chop!
    assert_equal( 'string', a )
    assert_nil( ''.chop! )
  end
  
  def test_method_concat
    a = 'Hello, '
    a.concat( 'World' )
    a.concat( 33 )
    assert_equal( a, 'Hello, World!' )
  end
  
  def test_method_count
    a = 'Hello, World!'
    assert_equal( 5, a.count( 'lo' ) )
    assert_equal( 2, a.count( 'lo', 'o' ) )
    assert_equal( 4, a.count( 'Hello', '^l' ) )
    assert_equal( 4, a.count( 'e-m' ) )
  end
  
  def test_method_crypt
    assert_equal( 'shRK3aVg8FsI2', 'secret'.crypt( 'sh' ) )
    assert_equal( '_.a7BFdN8zXW6', 'secret'.crypt( '_...0abcd' ) )
  end
  
  def test_method_delete
    assert_equal( 'heo', 'hello'.delete( 'l', 'lo' ) )
    assert_equal( 'he', 'hello'.delete( 'lo' ) )
    assert_equal( 'hell', 'hello'.delete( 'aeiou', '^e' ) )
    assert_equal( 'ho', 'hello'.delete( 'ej-m' ) )
  end
  
  def test_method_delete!
    a = 'hello'
    a.delete!( 'l', 'lo' )
    assert_equal( 'heo', a )
    assert_nil( 'a'.delete!( 'l' ) )
  end
  
  def test_method_downcase
    assert_equal( 'hello', 'hElLo'.downcase )
  end
  
  def test_method_downcase!
    a = 'hElLo'
    a.downcase!
    assert_equal( 'hello', a )
    assert_nil( a.downcase! )
  end
  
  def test_method_dump
    assert_equal( '"hello"', 'hello'.dump )
    assert_equal( '"hello\nthere"', "hello\nthere".dump )
  end
  
  def test_method_each
    pieces = []
    "hello\nworld".each do | s |
      pieces << s
    end
    assert_equal( "hello\n", pieces[0] ) 
    assert_equal( 'world', pieces[1] )
    
    pieces = []
    "hello\nworld".each( 'l' ) do | s |
      pieces << s
    end
    assert_equal( 'hel', pieces[0] ) 
    assert_equal( 'l', pieces[1] )
    assert_equal( "o\nworl", pieces[2] )
    assert_equal( 'd', pieces[3] )
    
    pieces = []
    "hello\n\n\nworld".each( '' ) do | s |
      pieces << s
    end
    assert_equal( "hello\n\n\n", pieces[0] )
    assert_equal( 'world', pieces[1] )
  end
  
  def test_method_each_line
    pieces = []
    "hello\nworld".each_line do | s |
      pieces << s
    end
    assert_equal( "hello\n", pieces[0] ) 
    assert_equal( 'world', pieces[1] )
    
    pieces = []
    "hello\nworld".each_line( 'l' ) do | s |
      pieces << s
    end
    assert_equal( 'hel', pieces[0] ) 
    assert_equal( 'l', pieces[1] )
    assert_equal( "o\nworl", pieces[2] )
    assert_equal( 'd', pieces[3] )
    
    pieces = []
    "hello\n\n\nworld".each_line( '' ) do | s |
      pieces << s
    end
    assert_equal( "hello\n\n\n", pieces[0] )
    assert_equal( 'world', pieces[1] )
  end
  
  def test_method_each_byte
    pieces = []
    "hello".each_byte do | s |
      pieces << s
    end
    assert_equal( 104, pieces[0] ) 
    assert_equal( 101, pieces[1] ) 
    assert_equal( 108, pieces[2] ) 
    assert_equal( 108, pieces[3] ) 
    assert_equal( 111, pieces[4] ) 
  end
  
  def test_method_empty?
    assert( ! 'hello'.empty? )
    assert( ''.empty? )
  end
  
  def test_method_eql?
    assert( ! 'cat'.eql?( 'dog' ) )
    assert( 'cat'.eql?( 'cat' ) )
  end
  
  def test_method_gsub
    assert_equal( 'h*ll*', 'hello'.gsub( /[aeiou]/, '*' ) )
    assert_equal( 'h<e>ll<o>', 'hello'.gsub( /([aeiou])/, '<\1>' ) )
    assert_equal( '104 101 108 108 111 ', 'hello'.gsub( /./ ) { | s | s[ 0 ].to_s + ' ' } )
  end
  
  def test_method_gsub!
    a = 'hello'
    a.gsub!( /[aeiou]/, '*' )
    assert_equal( 'h*ll*', a )
    assert_nil( a.gsub!( /[aeiou]/, '*' ) )
  end
  
  def test_method_hex
    assert_equal( 10, '0x0a'.hex )
    assert_equal( 10, '0a'.hex )
    assert_equal( -4660, '-1234'.hex )
    assert_equal( 0, '0'.hex )
    assert_equal( 0, 'wombat'.hex )
  end
  
  def test_method_include?
    assert( 'hello'.include?( 'lo' ) )
    assert( ! 'hello'.include?( 'ol' ) )
    assert( 'hello'.include?( ?h ) )
  end
  
  def test_method_index
    assert_equal( 1, 'Hello, World!'.index( 'e' ) )
    assert_equal( 3, 'Hello, World!'.index( 'lo' ) )
    assert_equal( 8, 'Hello, World!'.index( 'o', 5 ) )
    assert_nil( 'Hello, World!'.index( 'a' ) )
    assert_equal( 1, 'Hello, World!'.index( 101 ) )
    assert_equal( 8, 'Hello, World!'.index( /[aeiou]/, -6 ) )
  end
  
  def test_method_insert
    assert_equal( 'Xabcd', 'abcd'.insert( 0, 'X' ) )
    assert_equal( 'abcXd', 'abcd'.insert( 3, 'X' ) )
    assert_equal( 'abcdX', 'abcd'.insert( 4, 'X' ) )
    assert_equal( 'abXcd', 'abcd'.insert( -3, 'X' ) )
    assert_equal( 'abcdX', 'abcd'.insert( -1, 'X' ) )
    assert_raise( IndexError ) { 'abcd'.insert( -13, 'X' ) }
    assert_raise( IndexError ) { 'abcd'.insert( 13, 'X' ) }
  end
  
  def test_method_intern
    assert_equal( :koala, 'koala'.intern )
    sym = '$1.50 for a soda?!?!'.intern
    assert_equal( '$1.50 for a soda?!?!', sym.to_s )
  end

  def test_method_length
    assert_equal( 13, 'Hello, World!'.length )
  end
  
  def test_method_ljust
    assert_equal( 'hello', 'hello'.ljust( 4 ) )
    assert_equal( 'hello               ', 'hello'.ljust( 20 ) )
    assert_equal( 'hello***************', 'hello'.ljust( 20, '*' ) )
    assert_equal( 'hello dolly dolly do', 'hello'.ljust( 20, ' dolly' ) )
  end
  
  def test_method_lstrip
    assert_equal( 'hello   ', '   hello   '.lstrip )
    assert_equal( "\000 hello   ", "\000 hello   ".lstrip )
    assert_equal( 'hello', 'hello'.lstrip )
  end
  
  def test_method_lstrip!
    a = '   hello   '
    a.lstrip!
    assert_equal( 'hello   ', a )
    assert_nil( 'hello'.lstrip! )
  end
  
  def test_method_match
    assert_equal( 'll', 'hello'.match( '(.)\1' )[ 0 ] )
    assert_equal( 'l', 'hello'.match( '(.)\1' )[ 1 ] )
    assert_nil( 'hello'.match( 'xx' ) )
  end
  
  def test_method_oct
    assert_equal( 83, '123'.oct )
    assert_equal( -255, '-377'.oct )
    assert_equal( 0, 'bad'.oct )
    assert_equal( 255, '0377bad'.oct )
  end

end

