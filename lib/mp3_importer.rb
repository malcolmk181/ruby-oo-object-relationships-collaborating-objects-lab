class MP3Importer
    attr_accessor :path
    
    def initialize(path)
        @path = path
    end

    def files
        # Dir[path] from https://stackoverflow.com/questions/1755665/get-names-of-all-files-from-a-folder-with-ruby
        f = Dir["#{path}/*.mp3"]
        
        # inline map, use of gsub from previous assignment, regex interpolation
        f.map! {|fname| fname.gsub(/#{path}\//,"") }
    end

    def import
        files.each {|file| Song.new_by_filename(file) }
    end
end