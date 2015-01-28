def bubble_sort(array)
	swap = false
	k = 0
	while (k < array.length)
		i = 0
		while(i < array.length - 1)
			if array[i] > array[i + 1]
				temp = array[i + 1]
				array[i + 1] = array[i]
				array[i] = temp
				swap = true
			end
			i += 1
		end
		if swap == false
			break
		end
		k += 1
	end
	return array
end

array = [6, 10, 3, 2, 11, 19, 12, 7, 4, 1]
p bubble_sort(array)
