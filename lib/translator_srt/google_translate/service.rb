require 'net/http'
require 'json'
require 'tempfile'
require 'resource_accessor'

module TranslatorSrt
  module GoogleTranslate
    class Service
      GOOGLE_TRANSLATE_SERVICE_URL = "translate.google.com"

      def translate(from_lang, to_lang, text)
        raise("Missing 'from' language") unless from_lang
        raise("Missing 'to' language") unless to_lang
        raise("Missing text for translation") unless text

        r = call_translate_service(from_lang, to_lang, text)

        result = JSON.parse(r.gsub('[,', '['))

        raise("Translate Server is down") if (!result || result.empty?)

        result
      end

      private

      def translate_url(from_lang, to_lang)
        "https://#{GOOGLE_TRANSLATE_SERVICE_URL}/translate_a/single?client=t&sl=#{from_lang}&tl=#{to_lang}&hl=en&dt=bd&dt=ex&dt=ld&dt=md&dt=qc&dt=rw&dt=rm&dt=ss&dt=t&dt=at&dt=sw&ie=UTF-8&oe=UTF-8&prev=btn&rom=1&ssel=0&tsel=0"
      end

      def call_translate_service from_lang, to_lang, text
        url = translate_url(from_lang, to_lang)

        response = call_service(url, normalize_to_translate(text))

        response.body.split(',').collect { |s| s == '' ? "\"\"" : s }.join(",") # fix json object
      end

      def call_service url, q
        accessor = ResourceAccessor.new

        accessor.get_response url: url, :method => :post, :body => {q: q}
      end

      def normalize_to_translate text
        text.gsub(":", "#").gsub(",", "##").gsub("-->", "###")
      end
    end
  end
end