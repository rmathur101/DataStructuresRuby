def merge_sort(array)
	return if array.length < 2
	mid = array.length / 2
	left = []
	right = []
	(0..(mid-1)).each do |i|
		left << array[i]
	end
	(mid..(array.length - 1)).each do |i|
		right << array[i]
	end
	merge_sort(left)
	merge_sort(right)
	merge(left, right, array)
end

def merge(left, right, array)
	i = 0
	j = 0
	k = 0
	while (i < left.length && j < right.length)
		if (left[i] <= right[j])
			array[k] = left[i]
			k += 1
			i += 1
		elsif (right[j] < left[i])
			array[k] = right[j]
			k += 1
			j += 1
		end
	end
	while (i < left.length)
		array[k] = left[i]
		k += 1
		i += 1
	end
	while (j < right.length)
		array[k] = right[j]
		k += 1
		j += 1
	end
	return array
end

array = [6, 10, 3, 2, 11, 19, 12, 7, 4, 1]

p merge_sort(array)