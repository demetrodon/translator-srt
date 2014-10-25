require 'google_translate/result_parser'
require 'google_translate/service'

module TranslatorSrt
  module GoogleTranslate
    def self.t(from_lang, to_lang, text)
      result = Service.new.translate(from_lang, to_lang, text)

      puts "Translated srt"

      ResultParser.new(result).to_s
    end
  end
end