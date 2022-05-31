class Song
    attr_accessor :name, :artist

    @@all = []

    def self.all
        @@all
    end

    def initialize(name)
        @name = name
        self.class.all << self
    end

    def artist_name
        !@artist.nil? ? @artist.name : nil
    end

    def artist_name=(name)
        @artist = Artist.find_or_create_by_name(name)
    end

    # modified from previous assignment
    def self.new_by_filename(filename)
        filename_array = filename.split(' - ')
        artist = filename_array[0]
        name = filename_array[1].gsub(/\..+/, '')
    
        song = self.new(name)
        song.artist_name = artist
        song
    end
end