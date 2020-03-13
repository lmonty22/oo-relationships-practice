class Listing


    attr_reader :city

    @@all_listing = []

    def initialize(city)
        @city = city
        @@all_listing << self
    end

    #returns array of guest who have stayed
    #at listing
    def guests
        trips = Trip.all.select do |trip_instance|
            trip_instance.listing == self
        end

       trips.map do |trip_instance|
            trip_instance.guest
       end
    end

    #  returns an array of all trips at a listing
    def trips
        Trip.all.select do |trip_instance|
            trip_instance.listing == self 
        end
    end

    #returns the number of trips that have been taken to that listing
    def trip_count
        trips = Trip.all.select {|trip_instance| trip_instance.listing == self}.length
    end

    def self.all
        @@all_listing
    end

    #takes argument of city as a string
    #returns all listings of that city
    def self.find_all_by_city(input_city)
        self.all.select {|li| li.city == input_city}
    end
    
    #find the listing with the most trips
    def self.most_popular
        #we need to find the listings and count the number of trips they have 
        #return the listing with the most trips 
        most_popular= 0 
        most_popular_listing = nil 

        Listing.all.each do |li| 
           if li.trip_count > most_popular
                most_popular = li.trip_count
                most_popular_listing = li
           end 
        end 
        most_popular_listing
    end

end