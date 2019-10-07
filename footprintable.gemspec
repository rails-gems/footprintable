$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "footprintable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "footprintable"
  s.version     = Footprintable::VERSION
  s.authors     = ["mars"]
  s.email       = ["578595193@qq.com"]
  s.homepage    = "https://github.com/rails-gems/footprintable"
  s.summary     = "track model column change."
  s.description = "track model column change."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "< 7"

  s.add_development_dependency "sqlite3"
end
