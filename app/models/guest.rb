class Guest

    attr_accessor :name

    @@all_guests = []

    def initialize(name)
        @name = name
        @@all_guests << self
    end

    
    #returns an array of all trips a guest has made
    def trips 
        Trip.all.select do |ti|
            ti.guest == self
        end
    end

      #returns an array of all listings a guest has stayed at
      def listings
         self.trips.map do  |ti|
             ti.listing 
         end
     end
# returns the number of trips a guest has taken
    def trip_count
        self.trips.count
    end

    def self.all
        @@all_guests
    end
    # returns an array of 
    #all guests who have made over 1 trip
    def self.pro_traveller
        self.all.select do |gi|
            gi.trip_count > 1
        end
    end

    #argument of a name as a string
    #returns all guest with that name
    def self.find_all_by_name(name)
        self.all.select {|gi| gi.name == name }
    end

end