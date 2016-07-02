arr = ARGV
new_array = []
splitters = arr.to_s.split('')

splitters.each do |split|
	new_array << split.to_i if split.to_i > 0 
end

puts "Output: #{new_array}"
