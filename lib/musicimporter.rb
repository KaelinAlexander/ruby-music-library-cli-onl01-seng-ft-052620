class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    filenames = Dir.chdir(@path) do | path |
            Dir.glob("*.mp3")
        end
        puts "names=#{filenames}"
        filenames
  end

  def import
    files.each { |filename| Song.create_from_filename(filename) }
  end

end
