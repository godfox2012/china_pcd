$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "china_pcd/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "china_pcd"
  s.version     = ChinaPcd::VERSION
  s.authors     = ["godfox"]
  s.email       = ["godfox@yeah.net"]
  s.homepage    = "https://github.com/godfox2012/china_pcd"
  s.summary     = "中国省市区"
  s.description = "自用engine，提供中国省市区数据"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.1.6"

  s.add_dependency "jquery-rails"
  s.add_dependency "coffee-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'launchy'
  s.add_development_dependency 'poltergeist'
end
