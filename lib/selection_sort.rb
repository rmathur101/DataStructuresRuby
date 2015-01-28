def selection_sort(array)
	i = 0
	while(i < array.length - 1)
		j = i + 1
		while(j < array.length)
			if(array[j] < array[i])
				temp = array[j]
				array[j] = array[i]
				array[i] = temp
			end
			j += 1
		end
		i += 1
	end
	return array
end


array = [6, 10, 3, 2, 11, 19, 12, 7, 4, 1]
p selection_sort(array)
