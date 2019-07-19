class Follower

    attr_accessor :name, :age, :life_motto

    @@all =[]

    def initialize(name, age, life_motto)
        @name = name 
        @age = age
        @life_motto = life_motto

        @@all << self
    end 

    def cults 
        cult = []
        Bloodoath.all.each do |oath|
           if oath.follower == self
            cult << oath.cult
           end 
        end 
        cult

        # binding.pry
        # Bloodoath.all.select do |oath|
        #     oath.follower == self
        # end 
    end 

    def join_cult(cult)
        Bloodoath.new(cult, self, "_2019-07-19_")
    end 

    def self.all
        @@all
    end

    def self.of_a_certain_age(age)
        Follower.all.select do |follower|
            follower.age >= age
        end
    end





end 