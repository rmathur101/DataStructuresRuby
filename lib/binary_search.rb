def binary_search(array, value)
	lower = 0
	upper = array.length - 1

	while(lower < upper)
		mid = lower + (lower + upper)/2
		return true if array[mid] == value

		if value < array[mid]
			upper = mid - 1
		elsif value > array[mid]
			lower = mid + 1
		end

	end

	return false
end