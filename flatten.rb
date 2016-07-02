def flatten_array(arr)
	new_array = []
	splitters = arr.to_s.split('')

	splitters.each do |split|
		new_array << split.to_i if split.to_i > 0 
	end

	puts "Output: #{new_array}"
end

print "insert your array >"
new_array = $stdin.gets.chomp
flatten_array(new_array)
