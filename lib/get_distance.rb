class GetDistance

	def self.run	
		path = "app/assets/csv/students.csv"
		students_list = CSV.read(path)
		

		new_student_list = []
		students_list.each do |student|
			new_student_list << [student[0], student[1], convert_distance(student[2], student[3]) ]
		end

		puts new_student_list
	end

end
