require 'csv'
require 'time'

#1)  Read a csv file into an array of hash

csv_data=CSV.read("assignment.csv")

headers=csv_data.shift.map{|csv_data| csv_data.to_s}

string_data=csv_data.map { |row| row.map{|cell| cell.to_s}}

array_of_hash=string_data.map{|row| Hash[*headers.zip(row).flatten]}

puts array_of_hash

#2 Print details of each employee
array_of_hash.each do |info|
  info.each do |k,v|
    puts "#{k} : #{v}"#,"\n"
  end
 puts "\n"
end 

#3Find the max age of the employee

#puts array_of_hash.max_by{|d| d["age"]},"\n"
# show max ag emp name
#puts array_of_hash.max_by{|d| d["age"]}["name"]


#4 Print employee details who have joined in last 6 months
#5 print experience verdict with each emp
array_of_hash.each do |data| 
	#puts "---#{data}"
	j_month = Time.parse(data["joining_date"]).month
	j_year= Time.parse(data["joining_date"]).year
  c_month = Time.now.month
	c_year= Time.now.year

  m_diff=(c_year*12+c_month)-(j_year*12+j_month)
  puts "m_diff : ====>#{m_diff}"

	if m_diff<=6
		puts "Employee Joined in last 0-6 months/Freasher =====>\n#{data}"
	end	
	if m_diff >= 6 && m_diff<=24
	  puts "Beginner \n#{data}"
	end
	if m_diff >= 24 && m_diff<=36
	  puts "Implementer \n#{data}"
	end
  if m_diff >=36
    puts "Expert =====> \n#{data}"
  end
end

 #6Print dept wise employees

puts array_of_hash.group_by{|h| h["dept"]}.each{|_, vv| vv.map!{|h| h["name"]}}
#to display names dept wise
#1-------puts array_of_hash.group_by{|h| h["dept"]}.each{|_, vv| vv.map!{|h| h["name"]}}
#2----------puts array_of_hash.group_by{|h| h["dept"]}.each{|_, vv| vv.replace(vv.map{|h| h["name"]})}