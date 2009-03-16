require 'rubygems'
require 'rake'
require File.dirname(__FILE__) + '/lib/terror'
Dir["#{Terror.root}/lib/**/*.rake"].each{|ext| load ext}

set :root, File.join(Terror.root)

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    files  = `git ls-files`.split("\n").reject {|f| File.basename(f) =~ /^\.git/ }
    
    gem.name        = 'terror'
    gem.summary     = 'Terror the micro feed aggregator'
    gem.email       = "andrea@gravityblast.com"
    gem.homepage    = "http://gravityblast.com/projects/terror/"
    gem.authors     = ["Andrea Franz"]
    gem.files       = files
    gem.executables = ['terror']
    gem.post_install_message = 'Run terror projectname and start aggregating.'

    gem.add_dependency 'sinatra', ['>= 0.9.1.1']
    gem.add_dependency 'feed-normalizer', ['>= 1.5.1']
    gem.add_dependency 'activerecord', ['>= 2.2.2']
  end
rescue LoadError
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = false
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


task :default => :test
