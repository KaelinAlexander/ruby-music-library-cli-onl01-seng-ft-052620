require "pry"

class Artist
attr_accessor :name

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

  def songs
    @songs
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  # def songs
  #   Song.all.select {|song| song.artist == self}
  # end

  def self.find_or_create_by_name(name)
    if all.find {|artist| artist.name == name}
      all.find {|artist| artist.name == name}
    else
      self.new(name)
    end
  end

  def genres
    self.songs.collect{|s| s.genre}.uniq
  end

end
