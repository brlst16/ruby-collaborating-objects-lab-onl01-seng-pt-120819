require "pry"
class Song
  attr_accessor :artist, :name

@@all =[]

  def initialize(name)
    @name = name
    @@all << self
  end

  def artist_name=(name)
    @name = name
    self.artist = Artist.find_or_create_by_name(name)
    Artist.add_song(self)
  end

 
  def self.new_by_filename(file_name)
    song = file_name.split(" - ")[1]
  #  binding.pry 
    artist = file_name.split(" - ")[0]
    #binding.pry 
    new_song = self.new(song)
    new_song.artist = Artist.new(artist)
    new_song
   # binding.pry 
  end

  
  def self.all 
    @@all
    
  end 
end