# translator-srt 

SRT stands for SubRip text file format, which is a file for storing subtitles; This is a Ruby library for translate SRT files to other languages.
Current functionality includes **Google Translate** for translate your srt files.

## Installation

Add this line to your application's Gemfile:

    gem 'translator-srt'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install translator-srt

## Usage

For use you need to connect the necessary translation service.

### Tranlation by Google Translate

```ruby
require 'translator_srt/google_translate'

# Translate from srt string
translated_srt = TranslatorSrt::GoogleTranslate.translate_srt_string("en", "uk", srt_content)

# Translate from srt file
translated_srt = TranslatorSrt::GoogleTranslate.translate_srt_file("en", "uk", "/path/some.srt")

```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
