require_relative "_audiolog/audiolog.rb"

module Audiolog
  class Error < StandardError; end

  class Audio
    def self.record
      system("arecord --format=cd _audio/input.mp3")
    end

    def self.convert
      system("vosk-transcriber -i _audio/input.mp3 -o _input/input.txt")
    end

    def self.tokenize
      input = File.read("_input/input.txt").to_s.downcase

      filename = input.tr " ", "_"

      input_tokens = input.split(" ")

      iteration = input_tokens.size.to_i

      row  = 0

      open("output.rb", "w") { |f|
        iteration.times do
          string = input_tokens[row].strip

          f.puts "#{string} = :#{string}, '#{string}', '#{string}'"

          row = row + 1      
        end
      }
    end
  end
end
end
