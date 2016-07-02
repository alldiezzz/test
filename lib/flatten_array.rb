class FlattenArray
	def flatten_array_version_1(arr)
		arr.flatten
	end

	def flatten_array_version_2(arr)
		new_array = []
		splitters = arr.to_s.split('')
		
		splitters.each do |split|
			new_array << split if split.to_i > 0 &&
		end
		return new_array
	end
end
