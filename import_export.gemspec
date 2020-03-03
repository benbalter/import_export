# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'import_export/version'

Gem::Specification.new do |spec|
  spec.name          = 'import_export'
  spec.version       = ImportExport::VERSION
  spec.authors       = ['Ben Balter']
  spec.email         = ['ben.balter@github.com']
  spec.summary       = "A Ruby client for Trade.gov's Consolidated Screening List"
  spec.homepage      = 'https://github.com/benbalter/import_export'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'dotenv', '~> 2.7'
  spec.add_dependency 'iso_country_codes', '~> 0.7'
  spec.add_dependency 'rest-client', '~> 2.1'
  spec.add_dependency 'uuid', '~> 2.3'

  spec.add_development_dependency 'pry', '~> 0.12'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.9'
  spec.add_development_dependency 'rubocop', '~> 0.8'
  spec.add_development_dependency 'rubocop-performance', '~> 1.5'
  spec.add_development_dependency 'rubocop-rspec', '~> 1.38'
  spec.add_development_dependency 'webmock', '~> 3.7'
end
