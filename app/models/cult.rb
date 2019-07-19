class Cult

    attr_reader :year_founded, :slogan
    attr_accessor :name, :city

    @@all =[]
    def initialize(name, city, year_founded, slogan)
        @name = name 
        @city = city 
        @year_founded = year_founded 
        @slogan = slogan

        @@all << self
    end 

    def recruit_follower(follower)
        Bloodoath.new(self, follower, "_2019-07-19_")
    end

    def bloodoaths
        Bloodoath.all.select do |oath|
            oath.cult == self
        end
    
    end

    def cult_population
        population = 0
        
        bloodoaths.each do |oath|
            population += 1
        end
        population
    end

    def self.all
        @@all
    end

    def self.find_by_name(name)
        Cult.all.each do |cult|
            if cult.name == name
                return cult
            end
        end
    end

    def self.find_by_location(location)
        Cult.all.select do |cult|
             cult.city == location
            
        end
    end

    def self.find_by_founding_year(year)
        Cult.all.select do |cult|
            cult.year_founded == year
        end
    end
    


            




end 