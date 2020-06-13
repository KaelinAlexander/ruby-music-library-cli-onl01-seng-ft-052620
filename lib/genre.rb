class Genre
	attr_accessor :name
	attr_reader :artists, :songs
	@@all = []

		def initialize(name)
				@name = name
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

	def self.create(name)
		genre = Genre.new(name)
		genre.save
		genre
	end

	def songs
		@songs
	end

	# def add_song		#Adds has_many interface for songs.
	# 	@songs << song
	# 	song.genre = self	unless song.genre == self	#This reciprocates the relationship between a song and genre and closes a loop.
	# end
	#
	# def add_artist		#Adds has_many authors through stories interface.
	# 	self.songs.collect{|s| s.author}.uniq
	# end

end
