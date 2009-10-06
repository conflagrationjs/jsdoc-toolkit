require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "jsdoc-toolkit"
    gem.summary = %Q{RubyGem packaged version of jsdoc-toolkit with extra rake tasks for automating doc generation}
    gem.description = %Q{RubyGem packaged version of jsdoc-toolkit with extra rake tasks for automating doc generation}
    gem.email = "gabriel.gironda@gmail.com"
    gem.homepage = "http://github.com/gabrielg/jsdoc-toolkit"
    gem.authors = ["ggironda"]
    gem.add_development_dependency "riot"
    gem.files = (gem.files + FileList["src/**/*"]).uniq
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/*_test.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :test => :check_dependencies

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  if File.exist?('VERSION')
    version = File.read('VERSION')
  else
    version = ""
  end

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "jsdoc-toolkit #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
