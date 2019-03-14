require 'csv'


#1)  Read a csv file into an array of hash

csv_data=CSV.read("assignment.csv")

headers=csv_data.shift.map{|csv_data| csv_data.to_s}

string_data=csv_data.map { |row| row.map{|cell| cell.to_s}  }

array_of_hash=string_data.map{|row| Hash[*headers.zip(row).flatten]}

#2 Print details of each employee
array_of_hash.each do |info|
  info.each do |k,v|
    puts "#{k} : #{v}","\n"
  end
 puts "\n"
end 

#3Find the max age of the employee

puts array_of_hash.max_by{|d| d["age"]}
# show max ag emp name
#puts array_of_hash.max_by{|d| d["age"]}["name"]

#4 Print employee details who have joined in last 6 months


