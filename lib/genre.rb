require_relative "./concerns/modules.rb"

class Genre
	attr_accessor :name
	attr_reader :artists, :songs
	@@all = []
	extend Concerns::Findable

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

	def add_song
		@songs << song
		song.genre = self	unless song.genre == self
	end

	def artists
		self.songs.collect{|s| s.artist}.uniq
	end

end
