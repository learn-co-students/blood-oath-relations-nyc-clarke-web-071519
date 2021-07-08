class Cult

    # Cult#minimum_age returns a `Fixnum` that is the minimum age required for followers joining this cult
    attr_accessor :minimum_age
    
    # Cult#name returns a `String` that is the cult's name
    # Cult#locationreturns a `String` that is the city where the cult is located
    # Cult#founding_year returns a `Fixnum` that is the year the cult was founded
    # Cult#slogan returns a `String` that is this cult's slogan
    attr_reader :name, :location, :founding_year, :slogan
    

    @@all = []

    def initialize (name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan

        @@all << self
    end

    # Cult.all returns an `Array` of all the cults
    def self.all
        @@all
    end

    # Cult#recruit_follower takes in an argument of a `Follower` instance and adds them to this cult's list of followers
    # BONUS
    # Cult#recruit_follower takes in an argument of a `Follower` instance and adds them to this cult's list of followers
    # NOW this is changed such that if the given `Follower` instance is not of age:
    # - do not let them join the cult
    # - print out a friendly message informing them that they are too young
    def recruit_follower(follower)
        if follower.age >= self.minimum_age
            BloodOath.new(Date.today.to_s, self, follower)
        else
            puts "Sorry! The minimum age to join #{self.name} is #{self.minimum_age}. Please come back in #{self.minimum_age - follower.age} years!"
        end
    end

    # Cult#cult_population returns a `Fixnum` that is the number of followers in this cult
    def cult_population
        cult_population_array = []
        BloodOath.all.each do |bloodoath|
            if bloodoath.cult == self
            cult_population_array << bloodoath.follower
            end
        end
        # With Select Method 
        # BloodOath.all.select {|bloodoath| bloodoath.cult == self}.length
        cult_population_array.length
    end

    # Cult.find_by_name takes a `String` argument that is a name and returns a `Cult` instance whose name matches that argument
    def self.find_by_name(name)
        self.all.find {|cult| cult.name == name }
    end

    # Cult.find_by_location takes a `String` argument that is a location and returns an `Array` of cults that are in that location
    def self.find_by_location(location)
        self.all.select {|cult| cult.location == location}
    end

    # Cult.find_by_founding_year takes a `Fixnum` argument that is a year and returns all of the cults founded in that year
    def self.find_by_founding_year(year)
        self.all.select {|cult| cult.founding_year == year}
    end

    # Cult#average_age returns a `Float` that is the average age of this cult's followers
    def followers
        cult_bloodoaths = BloodOath.all.select {|bloodoath| bloodoath.cult == self}
        cult_bloodoaths.map {|bloodoath| bloodoath.follower}
    end

    def average_age
        follower_ages = followers.map {|follower| follower.age }
        follower_ages.reduce {|total, age| total+age}.to_f / cult_population
    end

    # Cult#my_followers_mottos prints out all of the mottos for this cult's followers
    def my_followers_mottos
        followers.each { |follower| puts follower.life_motto }
    end

    # Cult.least_popular returns the `Cult` instance who has the least number of followers :(
    def self.least_popular
        self.all.min_by {|cult| cult.cult_population} 
    end

    # Cult.most_common_location returns a `String` that is the location with the most cults
    def self.cult_locations
        self.all.map {|cult| cult.location }.uniq
    end
        
    def self.most_common_location
        cult_locations.max_by {|location| find_by_location(location).length }
    end

end