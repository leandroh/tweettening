module Tweettening
  class Mp3
    def initialize(file)
      @file = file
    end

    def play
      parse
    end

    def valid?
      exists? && is_mp3?
    end

    private

    def show
      puts "tweettening ♫ #{@artist} - #{@song}"
      "tweettening ♫ #{@artist} - #{@song}"
    end

    def exists?
      File.exists?(@file)
    end

    def has_tag?
      @tag == "TAG"
    end

    def is_mp3?
      @file.split('.').last.downcase == "mp3"
    end

    def parse
      unless valid?
        abort "=> Invalid arguments. Usage: ./tweettening file.mp3"
      end

      @tag, @song, @artist, @album, @year, @comment, @genre = fileTail(@file, 128).unpack("A3A30A30A30A4A30C")

      if has_tag?
        show
      else
        abort "=> (#{@file}: ID3 tag was not found!"
      end
    end

    def fileTail(file, offset)
      f=File.new(file.to_s)
      f.seek(-offset,IO::SEEK_END)
      f.read
    end
  end
end
