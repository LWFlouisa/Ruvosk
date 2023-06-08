require_relative "_audiolog/audiolog.rb"

## Converts the audio to text.
Audiolog::Audio.convert

## Tokenizes the audio input into prolog facts.
Audiolog::Audio.tokenize
