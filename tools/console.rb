require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

cult1 = Cult.new("cult1", "NY", 1950, "we are the best")
cult2 = Cult.new("cult2", "NJ", 1975, "Garden State")

follower1 = Follower.new("Andrew", 26, "im 26")
follower2 = Follower.new("Jason", 22, "sports are life")

oath1 = Bloodoath.new(cult1, follower1, "_2019-07-15_")
oath2 = Bloodoath.new(cult2, follower2, "_2017-10-31_")

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
