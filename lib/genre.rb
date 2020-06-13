class Genre
	attr_accessor :name
	@@all = []

	def initialize(name)
	      @name = name
        @songs = []
        @artists = []
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
    genre = Genre.new(name)
    genre.save
    genre
  end

	def songs
		@songs
	end

	def artists
		@artists
	end

	def add_song		#Adds has_many interface for stories.
		@songs << song
		song.category = self	unless song.genre == self	#This reciprocates the relationship between a story and category and closes a loop.
	end

	def add_artist		#Adds has_many authors through stories interface.
		self.songs.collect{|s| s.author}.uniq
	end

end
