#!/usr/bin/env ruby -w


puts
puts 'TESTING WITH TEST::UNIT==========================='
puts
puts `ruby test/ts_built_in_classes_and_modules.rb`
puts
puts 'TESTING WITH RSPEC================================'
puts
puts `spec spec/tc_string.rb`
puts
puts '=================================================='
puts


