require 'rubygems'
require 'rake'
require 'rdoc'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), *%w[lib]))

# Returns the name of the project
def name
  @name ||= Dir['*.gemspec'].first.split('.').first
end

# Returns the version number of the project
def version
  line = File.read("lib/#{name}/version.rb")[/^\s*VERSION\s*=\s*.*/]
  line.match(/.*VERSION\s*=\s*['"](.*)['"]/)[1]
end

task :default => [:test]

# << test
require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

# << rdoc
require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "#{name} #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

task :console do
  require 'irb'
  require 'irb/completion'
  require 'doc2json' 
  ARGV.clear
  IRB.start
end

