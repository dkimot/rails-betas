$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "canary_labs/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "canary_labs"
  s.version     = CanaryLabs::VERSION
  s.authors     = ["Davis Kimoto"]
  s.email       = ["davis.kimoto@gmail.com"]
  s.homepage    = "https://github.com/dkimot/rails-canary_labs"
  s.summary     = "https://github.com/dkimot/rails-canary_labs"
  s.description = "Description of CanaryLabs."
  s.license     = "MIT"

  s.files         = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.require_paths = ["lib"]
  s.test_files    = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.11.1"

  s.add_development_dependency "sqlite3"
end
