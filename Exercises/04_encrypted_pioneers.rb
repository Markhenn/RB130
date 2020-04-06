# The following list contains the names of individuals who are pioneers in the field of computing or that have had a significant influence on the field. The names are in an encrypted form, though, using a simple (and incredibly weak) form of encryption called Rot13.
#
# Problem
# Decipher the names give with rot13
# input: string
# output: string
# words are rotated by 13 places
# this works back and forth
# A -> N, N -> A,
# Space remains a space
#
# Test Cases: see below
#
# Algorithm
# create hash as look up table
# split string into chars
# call map on chars
#   return the corresponding value from the hash
#   if it doesnt exist return the original word
# call join on the result


def set_rot_hash13
  keys = ('A'..'Z').to_a + ('a'..'z').to_a
  values = ('N'..'Z').to_a + ('A'..'M').to_a + ('n'..'z').to_a + ('a'..'m').to_a
  keys.zip(values).to_h
end

def rot13(str)
  rot_hash = set_rot_hash13
  str.chars.map { |c| rot_hash[c] || c }.join
end

# puts rot13('Nqn Ybirynpr')
# puts rot13('Tenpr Ubccre')
# puts rot13('Nqryr Tbyqfgvar')
# puts rot13('Nyna Ghevat')
# puts rot13('Puneyrf Onoontr')
# puts rot13('Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv')
# puts rot13('Wbua Ngnanfbss')
# puts rot13('Ybvf Unvog')
# puts rot13('Pynhqr Funaaba')
# puts rot13('Fgrir Wbof')
# puts rot13('Ovyy Tngrf')
# puts rot13('Gvz Orearef-Yrr')
# puts rot13('Fgrir Jbmavnx')
# puts rot13('Xbaenq Mhfr')
# puts rot13('Fve Nagbal Ubner')
# puts rot13('Zneiva Zvafxl')
# puts rot13('Lhxvuveb Zngfhzbgb')
# puts rot13('Unllvz Fybavzfxv')
# puts rot13('Tregehqr Oynapu')
# Write a program that deciphers and prints each of these names .
#
# LS Solution


ENCRYPTED_PIONEERS = [
  'Nqn Ybirynpr',
  'Tenpr Ubccre',
  'Nqryr Tbyqfgvar',
  'Nyna Ghevat',
  'Puneyrf Onoontr',
  'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
  'Wbua Ngnanfbss',
  'Ybvf Unvog',
  'Pynhqr Funaaba',
  'Fgrir Wbof',
  'Ovyy Tngrf',
  'Gvz Orearef-Yrr',
  'Fgrir Jbmavnx',
  'Xbaenq Mhfr',
  'Fve Nagbal Ubner',
  'Zneiva Zvafxl',
  'Lhxvuveb Zngfhzbgb',
  'Unllvz Fybavzfxv',
  'Tregehqr Oynapu'
].freeze

def rot13(encrypted_text)
  encrypted_text.each_char.reduce('') do |result, encrypted_char|
    result + decipher_character(encrypted_char)
  end
end

def decipher_character(encrypted_char)
  case encrypted_char
  when 'a'..'m', 'A'..'M' then (encrypted_char.ord + 13).chr
  when 'n'..'z', 'N'..'Z' then (encrypted_char.ord - 13).chr
  else                         encrypted_char
  end
end

ENCRYPTED_PIONEERS.each do |encrypted_name|
  puts rot13(encrypted_name)
end
