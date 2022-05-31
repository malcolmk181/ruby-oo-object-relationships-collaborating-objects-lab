class Artist
    attr_accessor :name

    @@all = []

    def self.all
        @@all
    end

    def initialize(name)
        @name = name
        self.class.all << self
    end

    def add_song(song)
        song.artist = self
    end

    def add_song_by_name(name)
        song = Song.new(name)
        add_song(song)
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def self.song_count
        Song.all.count
    end

    def print_songs
        songs.each {|song| puts song.name}
    end

    def self.find_by_name(name)
        self.all.find { |artist| artist.name == name }
    end

    def self.find_or_create_by_name(name)
        result = self.find_by_name(name)
        !result.nil? ? result : self.new(name)
    end
end