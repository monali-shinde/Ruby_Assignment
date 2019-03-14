require 'csv'


#1)  Read a csv file into an array of hash

csv_data=CSV.read("assignment.csv")

headers=csv_data.shift.map{|csv_data| csv_data.to_s}

string_data=csv_data.map { |row| row.map{|cell| cell.to_s}  }

array_of_hash=string_data.map{|row| Hash[*headers.zip(row).flatten]}

#puts array_of_hash

#2 Print details of each employee
array_of_hash.each do |info|
  info.each do |k,v|
    puts "#{k} : #{v}"#,"\n"
  end
 puts "\n"
end 

#3Find the max age of the employee

puts array_of_hash.max_by{|d| d["age"]},"\n"
# show max ag emp name
#puts array_of_hash.max_by{|d| d["age"]}["name"]


#4 Print employee details who have joined in last 6 months
#if array_of_hash.map { |e| e  }
 #print array_of_hash.map { |e| e["joining_date"- Date.today()]  }



 #5 print experience verdict with each emp
 #(if expi is 0 to 6 months- fresher, 6 months to 24 months- beginner, bet 2 to 4 years- implementer, 3+years- expert)

 #6Print dept wise employees

puts array_of_hash.group_by{|h| h["dept"]}.each{|_, vv| vv.map!{|h| h["name"]}}
#to display names dept wise
#1-------puts array_of_hash.group_by{|h| h["dept"]}.each{|_, vv| vv.map!{|h| h["name"]}}
#2----------puts array_of_hash.group_by{|h| h["dept"]}.each{|_, vv| vv.replace(vv.map{|h| h["name"]})}

