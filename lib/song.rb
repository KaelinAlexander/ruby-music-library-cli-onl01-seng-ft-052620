class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
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

  def self.new_from_filename(file)
    name = file.split(" - ")[1]
    artist = file.split(" - ")[0]
    genre = file.split(" - ")[2].delete(".mp3")
    artist_object = Artist.find_or_create_by_name(artist)
    genre_object = Genre.find_or_create_by_name(genre)
    Song.new(name, artist_object, genre_object)
  end

  def self.create_from_filename(file)
    song = self.new_from_filename(file)
    song.save
  end

  def artist=(artist)
    @artist = artist
    self.artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.find_by_name(name)
      self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == NIL
      self.create(name)
    else
      self.find_by_name(name)
    end
  end

end
