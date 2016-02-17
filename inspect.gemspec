Gem::Specification.new do |s|
  s.name        = 'inspect'
  s.version     = '0.0.0'
  s.executables << 'inspect'
  s.date        = '2016-01-17'
  s.summary     = 'REPL for Json, CSV, and HTML.'
  s.description = 'Drop into a powerful REPL to inspect your Json, CSV, and HTML files.'
  s.authors     = ['Sina Siadat']
  s.email       = 'siadat+gem@gmail.com'
  s.files       = ['lib/inspect.rb']
  s.homepage    = 'https://github.com/siadat/inspect'
  s.license     = 'MIT'
  s.add_dependency 'pry', '~> 0.10.1'
  s.add_dependency 'nokogiri', '~> 1.6'
end
