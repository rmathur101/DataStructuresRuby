#NOTES
=begin
A hash function maps a larger domain onto a smaller range of values. For instance the domain of 'all strings' can be mapped to the smaller range of integers 0 -21 (see simple hash)

Charactersitics of a hash function:
1) determinisitc: every hash function with the same key must have the same value
2) domain is nearly uniformally distributed accrooss the range (and should avoid collisions)
3) should efficiently compute across the domain (it is common for the hash function to take constant time)

=end

def simple_hash(str)
	return 0 if str.empty?
	return str.ord - 'a'.ord
end
#this will return a integer and the range is only 26 values

def complex_hash(str)
	count = 16
	hash_value = 0
	str.each_char do |char|
		count -= 1
		break unless count > 0
		hash_value += (char.ord() - 'a'.ord()) << (count % 4)
	end
	return hash_value
end
#it is common that complexity increases as we try to smooth the distribution or increase the range

p simple_hash('what')
p complex_hash('what')