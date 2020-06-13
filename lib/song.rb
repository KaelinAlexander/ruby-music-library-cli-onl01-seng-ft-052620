require "pry"

class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist if artist
    @genre = genre if genre
  end

  def self.new_by_filename(file)
    name = file.split(" - ")[1]
    song = self.new(name)
    song.artist_name = file.split(" - ")[0]
    song
  end

  def artist=(artist)
    self.artist = Artist.find_or_create_by_name(artist)
    self.artist.add_song(self) unless artist.songs.include?(self)
  end

  def genre=(genre)
		@genre = genre
		genre.add_song(self) unless category.songs.include?(self)
	end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    all.clear
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def self.new_by_filename(file)
    name = file.split(" - ")[1]
    song = self.new(name)
    song.artist_name = file.split(" - ")[0]
    song
  end

  def artist=(artist)
    @artist = artist
    self.artist = Artist.find_or_create_by_name(name)
    self.artist.add_song(self)
  end

  def genre=(genre)
		@genre = genre
		genre.add_song(self) unless category.songs.include?(self)
	end

end
