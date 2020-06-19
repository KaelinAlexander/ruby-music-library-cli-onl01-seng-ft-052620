class MusicLibraryController

  def initialize(path = "./db/mp3s")
    library = MusicImporter.new(path)
    library.import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    input = gets.strip.downcase
    # while input != "exit"
=======
    while input != "exit"
      case input
    when "list songs"
      list_songs
      puts "What would you like to do?"
      input = gets.strip.downcase
    when "list artists"
      list_artists
      puts "What would you like to do?"
      input = gets.strip.downcase
    when "list genres"
      list_genres
      puts "What would you like to do?"
      input = gets.strip.downcase
    when "list artist"
      list_songs_by_artist
    when "list genre"
      list_songs_by_genre
      puts "What would you like to do?"
      input = gets.strip.downcase
    when "play song"
      play_song
      puts "What would you like to do?"
      input = gets.strip.downcase
    end
  end
end
end
