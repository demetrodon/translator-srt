require 'translator_srt/google_translate/result_parser'
require 'translator_srt/google_translate/service'

module TranslatorSrt
  module GoogleTranslate
    def self.translate_srt_file(from_lang, to_lang, path_srt_file)
      srt_file_content = File.read(path_srt_file)
      result = Service.new.translate(from_lang, to_lang, srt_file_content)

      puts "Translated srt string"

      ResultParser.new(result).to_s
    end
    def self.translate_srt_string(from_lang, to_lang, text)
      result = Service.new.translate(from_lang, to_lang, text)

      puts "Translated srt string"

      ResultParser.new(result).to_s
    end
  end
end