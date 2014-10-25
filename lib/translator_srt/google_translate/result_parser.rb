module TranslatorSrt
  module GoogleTranslate
    class ResultParser
      def initialize(result)
        @result = result
      end

      def to_s
        normalize_translation

        @result.join
      end

      private

      def normalize_translation
        to_one_ar

        list_keys = {
            "-->" => ["###"],
            "," => [" ## ", "##"],
            ":" => [" # ", "#"],
        }

        list_keys.each do |key_group, group|
          group.each do |key|
            @result.each_index do |index_translation|
              @result[index_translation] = @result[index_translation].gsub key, key_group
            end

          end
        end
      end

      def to_one_ar
        permit_translation

        result_in_one_array = []
        @result.each do |item|
          result_in_one_array.append item.first
        end

        @result = result_in_one_array
      end

      def permit_translation
        @result = @result.first
      end
    end
  end
end