namespace :test do
	desc "Get distance between gandaria city and students"
	task "get-distance" => :environment do
		require 'csv'
		start = Time.now
		puts ">>>> start: #{start}"

		path = "app/assets/csv/students.csv"
		students_list = CSV.read(path)
		

		new_student_list = []
		students_list.each do |student|
			distance = convert_distance( student[2].to_s.gsub('-', '').to_f, student[3].to_f)

			new_student_list << [student[0], student[1], distance] if distance <= 14
		end

		sorted = new_student_list.sort_by { |s| s[2]}
		create_new_csv(sorted)

		finish = Time.now
		puts ">>>> finish: #{finish}"
		puts ">>>> elapsed: #{finish-start}"
	end

	def convert_distance(latitude, longitude)
		rad_per_deg = Math::PI/180
		rkm = 6371
		
		latitude_target = 6.243376
		longitude_target = 106.784425

		distance_latitude_rad = (latitude - latitude_target) * rad_per_deg
		distance_longitude_rad = (longitude - longitude_target) * rad_per_deg

		latitude_radius_1 = latitude_target * rad_per_deg
		longitude_radius_1 = longitude_target * rad_per_deg

		latitude_radius_2 = latitude * rad_per_deg
		longitude_radius_2 = longitude * rad_per_deg

		calculation = Math.sin(distance_latitude_rad/2)**2 + Math.cos(latitude_radius_1) * Math.cos(latitude_radius_2) * Math.sin(distance_longitude_rad/2)**2
		final_calculation = 2 * Math::atan2(Math::sqrt(calculation), Math::sqrt(1-calculation))

		(rkm * final_calculation).round(2)
	end

	def create_new_csv(array)
		CSV.open("app/assets/csv/new_student_list.csv","w") do |csv|
			array.each do |arr|
				csv << arr
			end
		end
	end

end
