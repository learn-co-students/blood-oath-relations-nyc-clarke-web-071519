class Follower

    # Follower#name returns a `String` that is the follower's name
    # Follower#age returns a `Fixnum` that is the age of the follower
    # Follower#life_motto returns a `String` that is the follower's life motto
    attr_reader :name, :age, :life_motto

    @@all = []

    def initialize (name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto

        @@all << self
    end

    # Follower.all returns an `Array` of all the followers
    def self.all
        @@all
    end

    # Follower#cults returns an `Array` of this follower's cults
    def cults
       followers_bloodoaths = BloodOath.all.select {|bloodoath| bloodoath.follower == self}
       followers_bloodoaths.map {|bloodoath| bloodoath.cult}
    end

    # Follower#join_cult takes in an argument of a `Cult` instance and adds this follower to the cult's list of followers
    # BONUS
    # Follower#join_cult takes in an argument of a `Cult` instance and adds this follower to the cult's list of followers
    # NOW this is changed such that if you don't meet the minimum age requirement of the given `Cult` instance:
    # - do not let them join the cult
    # - print out a friendly message informing them that they are too young
    def join_cult(cult)
        if self.age >= cult.minimum_age
          BloodOath.new(Date.today.to_s, cult, self)
        else
          puts "Sorry! The minimum age to join #{cult.name} is #{cult.minimum_age}. Please come back in #{cult.minimum_age - self.age} years!"
        end
    end

    # Follower.of_a_certain_age takes a `Fixnum` argument that is an age and returns an `Array` of followers who are the given age or older
    def self.of_a_certain_age(age)
      self.all.select {|follower| follower.age >= age}
    end

    # Follower#my_cults_slogans prints out all of the slogans for this follower's cults
    def my_cults_slogans
      cults.each {|cult| puts cult.slogan }
    end

  # Follower.most_active returns the `Follower` instance who has joined the most cults
  def self.most_active   
    self.all.max_by {|follower| follower.cults.length} 
  end

  # Follower.top_ten returns an `Array` of followers; they are the ten most active followers
  def self.top_ten
    followers_sorted_by_activity = self.all.sort_by {|follower| follower.cults.length}
    followers_sorted_by_activity.last(10)
  end

  # Follower#fellow_cult_members returns a unique `Array` of followers who are in the same cults as you
  def fellow_cult_members
    friends = cults.map {|cult| cult.followers}.flatten.uniq
    friends.delete(self)
    friends
  end

end
