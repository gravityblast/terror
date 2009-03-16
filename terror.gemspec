# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{terror}
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Andrea Franz"]
  s.date = %q{2009-03-16}
  s.default_executable = %q{terror}
  s.email = %q{andrea@gravityblast.com}
  s.executables = ["terror"]
  s.extra_rdoc_files = ["README.md", "LICENSE"]
  s.files = ["LICENSE", "README.md", "Rakefile", "VERSION.yml", "bin/terror", "config/Rakefile.default", "config/config.ru.default", "config/terror.yml.default", "config/thin.yml.default", "lib/tasks/feeds.rake", "lib/terror.rb", "lib/terror/feed_fetcher.rb", "lib/terror/helper.rb", "lib/terror/installer.rb", "lib/terror/post.rb", "public/style.css", "terror.gemspec", "terror_aggregator.rb", "test/feeds/example.xml", "test/post_test.rb", "test/spec_helper.rb", "test/terror_test.rb", "views/feed.builder", "views/index.erb", "views/layout.erb"]
  s.has_rdoc = true
  s.homepage = %q{http://gravityblast.com/projects/terror/}
  s.post_install_message = %q{Run terror projectname and start aggregating.}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Terror the micro feed aggregator}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<sinatra>, [">= 0.9.1.1"])
      s.add_runtime_dependency(%q<feed-normalizer>, [">= 1.5.1"])
      s.add_runtime_dependency(%q<activerecord>, [">= 2.2.2"])
    else
      s.add_dependency(%q<sinatra>, [">= 0.9.1.1"])
      s.add_dependency(%q<feed-normalizer>, [">= 1.5.1"])
      s.add_dependency(%q<activerecord>, [">= 2.2.2"])
    end
  else
    s.add_dependency(%q<sinatra>, [">= 0.9.1.1"])
    s.add_dependency(%q<feed-normalizer>, [">= 1.5.1"])
    s.add_dependency(%q<activerecord>, [">= 2.2.2"])
  end
end
