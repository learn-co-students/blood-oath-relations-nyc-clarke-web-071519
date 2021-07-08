require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

facebook = Cult.new("Facebook", "New York", 2007, "Privacy is important")
twitter = Cult.new("Twitter", "California", 2008, "Chirp, tweet.")
instagram = Cult.new("Instagram", "New York", 2010, "Selfie")
snapchat = Cult.new("Snapchat", "Nevada", 2010, "These disappear")

andrew = Follower.new("Andrew", 26, "One good day at a time.")
valentino = Follower.new("Valentino", 31, "Age is just a number.")
aj = Follower.new("AJ", 25, "Go Yankees!")
hyo = Follower.new("Hyo", 24, "Let's do this!")
jason = Follower.new("Jason", 28, "Here we go!")

bloodoath1 = BloodOath.new("2019-07-15", facebook, andrew)
bloodoath2 = BloodOath.new("2018-08-18", twitter, valentino)
bloodoath3 = BloodOath.new("2000-01-01", twitter, andrew)
bloodoath4 = BloodOath.new("2010-04-09", instagram, valentino)
bloodoath5 = BloodOath.new("2009-03-12", snapchat, valentino)
bloodoath6 = BloodOath.new("2010-06-22", instagram, andrew)
bloodoath7 = BloodOath.new("2009-05-14", snapchat, andrew)
bloodoath8 = BloodOath.new("2005-02-02", facebook, aj)
bloodoath9 = BloodOath.new("2002-10-17", snapchat, aj)
bloodoath10 = BloodOath.new("2015-12-30", snapchat, hyo)
bloodoath11 = BloodOath.new("2014-11-08", instagram, jason)
bloodoath12 = BloodOath.new("1996-09-16", twitter, jason)

facebook.minimum_age = 20
twitter.minimum_age = 26
instagram.minimum_age = 18
snapchat.minimum_age = 12

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
