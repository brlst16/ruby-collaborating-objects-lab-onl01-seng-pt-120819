require "pry"
class Artist
  attr_accessor :name, :songs
  @@all = []  

  def initialize(name)
    @name = name
   # @songs = []
   #@@all << self 
   self.save
  end
  
  def songs
    #@songs
   Song.all.select {|song| song.artist == self }
   
  end 
  
  def self.all 
    @@all 
  end 




# describe '#add_song' do
#     it 'keeps track of an artist\'s songs' do
#       artist = Artist.new('Michael Jackson')
#       song_one = Song.new("Rock With You")
#       song_two = Song.new("Smooth Criminal")
#       smells_like_teen_spirit = Song.new("Smells Like Teen Spirit")
#       artist.add_song(song_one)
#       artist.add_song(song_two)
#       expect(artist.songs).to eq([song_one, song_two])
#     end
#   end


  def add_song(song)
    #@song << song
    #song.artist = self 
    self.songs << song 
    
   # self.songs << song 
    #binding.pry 
  end

  def save
    @@all << self  
  end
  
# #binding.pry
#   def self.all       
#     @@all 
#   end

  def self.find_or_create_by_name(name)  
    if self.find(name)
      self.find(name)
    else
      self.create(name)
    end
  end

  def self.find(name)     
    self.all.detect { |artist| artist.name == name }
  end

  def self.create(name)  
    artist = Artist.new(name)
    artist.save
    artist
  end

  def print_songs 
   # @songs.each do |song|
   #   puts song.name
   # end 
  # self.songs.each {|song| song.name}
  end
end



