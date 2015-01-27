#write a method that will determine whether or not a substring is part of a string

=begin

substring = word

string1 = sdkl;ajsdf;lajsdfl;jwordsl;dfjas;jfsd

string2 = wordasld;fjksad;fjkldsafjka;sdjf

string3 = slkjfdla;sjf;lsajfsjfl;word

=end

def is_substring?(str, substr)
	str.split('').each_with_index do |str_char, str_i|
		substr.split('').each_with_index do |substr_char, substr_i|
			break if substr_char != str[substr_i + str_i]
			return true if substring_found?(substr, substr_i)
		end
	end
	return false
end

def substring_found?(substr, substr_i)
	if substr.length - 1 == substr_i
		return true
	end
end

# p is_substring?('sdkl;ajsdf;lajsdfl;jwordsl;dfjas;jfsd', 'word')

# def reverse(string)
# end

string = 'abcdefg'
reversed = 'gfedcba'

p reverse(string) == reversed








