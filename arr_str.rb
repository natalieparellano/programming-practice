require 'pry'

def uniq_char?( str )
  # how many possible characters?
  found_chars = {}

  (0..str.length-1).each do |i|
    l = str[i]
    if found_chars[l]
      return false
    else
      found_chars[l] = true
    end
  end

  return true 
end

puts uniq_char?( "boardwalk" )
puts uniq_char?( "theory" )
puts ""

def is_permut?( str1, str2 )
  found_chars1 = found_chars( str1 )
  found_chars2 = found_chars( str2 )
  found_chars1 == found_chars2
end

def found_chars( str ) # O(length(str))
  found_chars = {}
  (0..str.length-1).each do |i|
    letter = str[i]
    if found_chars[letter]
      found_chars[letter] += 1
    else
      found_chars[letter] = 1
    end
  end
  return found_chars
end

puts is_permut?( "brag", "grab" )
puts is_permut?( "please", "lease" )
puts ""

def is_palindrome?( str )
  found_chars = found_chars( str )
  odd = 0
  found_chars.each do |letter, count|
    if count.odd?
      if odd == 0
        odd += 1
      else
        return false 
      end
    end
  end
  return true 
end

puts is_palindrome?( "octaatco" )
puts is_palindrome?( "acpapapca" )
puts is_palindrome?( "oocc" )
puts is_palindrome?( "apple" )
puts ""

def one_away?( str1, str2 ) # inefficient
  return false if ( str1.length - str2.length ).abs > 1
  str1 = sorted( str1 )
  str2 = sorted( str2 )

  shorter = str1.length <= str2.length ? str1.chars : str2.chars
  longer  = str1.length <= str2.length ? str2.chars : str1.chars

  removed = { shorter: [], longer: [] }

  while shorter.length > 0
    if shorter[0] == longer[0]
      [shorter,longer].each { |arr| arr.shift } # remove the first char
    else
      if longer[0] && ( longer[0] < shorter[0] )
        removed[:longer] << longer.shift
      else
        removed[:shorter] << shorter.shift
      end
      return false if more_than_one_away?( removed )
    end
  end

  if longer.length > 0
    longer.each { |char| removed[:longer] << char }
  end

  !more_than_one_away?( removed )
end

def more_than_one_away?( removed )
  removed[:shorter].length > 1 || removed[:longer].length > 1
end

def sorted( str )
  str.chars.sort.join
end

puts one_away?( "pale", "ple" )
puts one_away?( "pales", "pale" )
puts one_away?( "pale", "bale" )
puts one_away?( "pale", "bake" )
