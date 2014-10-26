lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'translator_srt/version'

Gem::Specification.new do |spec|
  spec.name          = 'translator-srt'
  spec.version       = TranslatorSrt::VERSION
  spec.authors       = ['Vadim Poplavskiy']
  spec.email         = ['im@demetrodon.com']
  spec.summary       = %q{Translator srt files}
  spec.description   = ''
  spec.homepage      = 'https://github.com/demetrodon/translator-srt'
  spec.license       = 'New BSD'

  spec.files         = `git ls-files`.split($/)
  spec.require_paths = ['lib']

  spec.add_dependency 'resource_accessor'
end
