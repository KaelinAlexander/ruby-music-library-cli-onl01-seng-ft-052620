require "pry"
require_relative "./concerns/modules.rb"

class Artist
attr_accessor :name
extend Concerns::Findable

@@all = []

  def initialize(name)
    @name = name
    @@all << self
    @songs = []
  end

  def self.all
    @@all
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

  def add_song(song)
    # new_song = Song.new(song)
    song.artist = self unless song.artist == self
    # Song.all << song unless Song.all.include?(song)
    @songs << song unless @songs.include?(song)
  end

  # def self.find_or_create_by_name(name)
  #   if all.find {|artist| artist.name == name}
  #     all.find {|artist| artist.name == name}
  #   else
  #     self.new(name)
  #   end
  # end

  def genres
    self.songs.collect{|s| s.genre}.uniq
  end

end
