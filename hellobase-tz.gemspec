$:.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'hellobase/time_zones/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'hellobase-tz'
  spec.version     = Hellobase::TimeZones::VERSION
  spec.authors     = ['Anthony Wang']
  spec.email       = ['awang@kodia.com']
  spec.summary     = 'Time zone helpers'
  spec.license     = 'MIT'
  spec.homepage    = 'https://github.com/K0D1A/hellobase-tz'

  spec.files = Dir['{lib}/**/*', 'MIT-LICENSE']

  spec.add_dependency 'tzinfo', '~> 2'
  spec.add_development_dependency 'minitest', '~> 5.14'
end
