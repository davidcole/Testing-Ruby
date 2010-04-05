#!/usr/bin/env ruby -w

$:.unshift File.join( File.dirname( __FILE__ ), '..', 'lib' )

describe String, "#*" do
  it "repeats Hello! three times" do
    "#{ 'Hello! ' * 3 }".should == 'Hello! Hello! Hello! '
  end
end

