#!/usr/bin/ruby

def numeral_to_roman number
  raise "this converter can only deal with numbers under 3000" if number > 3000

  thousands = number / 1000 % 10
  hundreds  = number /  100 % 10
  tens      = number /   10 % 10
  ones      = number        % 10

  roman_thousands = times thousands, "M"
  roman_hundreds  = singular_number hundreds, 'C', 'D', 'M'
  roman_tens      = singular_number tens, 'X', 'L', 'C'
  roman_ones      = singular_number ones, 'I', 'V', 'X'
  roman_thousands + roman_hundreds + roman_tens + roman_ones
end

def singular_number number, sign_for_ones, sign_for_fives, sign_for_tens
  case number
  when 0      then     ''
  when 1..3   then     times number, sign_for_ones
  when 4      then     sign_for_ones + sign_for_fives
  when 5      then     sign_for_fives
  when 6..8   then     sign_for_fives + times( number - 5, sign_for_ones )
  when 9      then     sign_for_ones + sign_for_tens
  end
end

def times number, sign
  [sign] * number * ''
end

puts numeral_to_roman( ARGV[0].to_i )
