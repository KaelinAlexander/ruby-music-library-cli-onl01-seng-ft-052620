require "pry"

class Artist
attr_accessor :name, :artist, :genre, :songs
@@all = []

  def initialize(name)
    @name = name
    @@all << self
    @songs = []
  end

  def self.all
    @@all
  end

  def add_song(song)
    new_song = Song.new(song)
    new_song.artist = self unless new_song.artist == self
    Song.all << song
  end

  def self.destroy_all
    all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  # def songs
  #   @songs = Song.all.select {|song| song.artist == self}
  #   @songs
  # end

  def self.find_or_create_by_name(name)
    artist = all.find {|artist| artist.name == name}
    if artist
      artist
    else
      artist = self.new(name)
    end
  end


end
