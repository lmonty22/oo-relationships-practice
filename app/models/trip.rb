class Trip

    attr_reader :listing, :guest
    #Both listing and guest will be instances
    # of list and guest class

    @@all_trips = []

    def initialize(listing, guest)
        @listing = listing
        @guest = guest
        @@all_trips << self
    end


    def self.all
        @@all_trips
    end

end