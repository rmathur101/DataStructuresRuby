#what do we want?
#suppose we have the following [1, 9, 6, 5, 2, 4]
#we want the array to be sorted so that [1, 2, 4, 5, 6, 9]

def insertion_sort(array)
	array.each_with_index do |value, i|
		(i).downto(0) do |j|
			if value < array[j]
				temp = array[j]
				array[j] = value
				array[j + 1] = temp
			end
		end
	end
	return array
end


array = [6, 10, 3, 2, 11, 19, 12, 7, 4, 1]
p insertion_sort(array)
