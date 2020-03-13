require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

require 'pry'

# binding.pry

puts  "-----Testing Guest Variables ----- " 
tom = Guest.new("Tom")
richard = Guest.new("Richard")
peter = Guest.new("Peter")
lindsay =Guest.new("Lindsay")
tom2 = Guest.new("Tom")
p tom.name == "Tom"
p richard.name == "Richard"
p peter.name == "Peter"

puts  "-----Testsing Listings Variables ----"
apt1 = Listing.new("Paris")
apt2 = Listing.new("Barcelona")
apt3 = Listing.new ("London")
apt4 = Listing.new("Paris")
p apt1.city == "Paris"
p apt2.city == "Barcelona"
p apt3.city == "London"
p apt4.city == "Paris"

puts "---- Testing Trip Varaibles ------"
trip1 = Trip.new(apt1, tom)
# binding.pry
p trip1.guest == tom 
p trip1.listing == apt1 

trip2 = Trip.new(apt2, richard)
p trip2.guest == richard
p trip2.listing == apt2

trip3 = Trip.new(apt3, peter)
p trip3.guest == peter
p trip3.listing == apt3

trip4 = Trip.new(apt1, richard)
p trip4.guest == richard
p trip4.listing == apt1

trip5 = Trip.new(apt2, peter)
p trip5.guest == peter
p trip5.listing == apt2 
p trip5.listing.city == "Barcelona"

trip6 = Trip.new(apt1, tom)

puts "-------Testing Guest Methods -----------"
p richard.listings == [apt2, apt1]
p richard.trips == [trip2, trip4]
p peter.trip_count == 2
p Guest.pro_traveller == [tom, richard, peter]
p Guest.find_all_by_name("Tom") == [tom, tom2]p Guest.all == [tom,richard,peter,lindsay, tom2]
puts "------Testing Listing Methods------- "
p Listing.all == [apt1, apt2, apt3, apt4]
p apt1.guests == [tom, richard, tom]
p apt2.guests == [richard, peter]
p apt3.trips == [trip3]
p apt1.trip_count == 3
p Listing.find_all_by_city("Paris") == [apt1, apt4]
p Listing.most_popular == apt1 


puts "-------Testing Trip Methods ----------"
p trip4.listing == apt1
p trip3.guest == peter
p Trip.all == [trip1, trip2, trip3, trip4, trip5, trip6]









