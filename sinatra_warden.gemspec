# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{sinatra_warden}
  s.version = "0.1.5.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Justin Smestad", "Daniel Neighman"]
  s.date = %q{2010-03-02}
  s.description = %q{basic helpers and authentication methods for using warden with sinatra also providing some hooks into Rack::Flash}
  s.email = %q{justin.smestad@gmail.com}
  s.executables = ["autospec", "css2sass", "edit_json.rb", "haml", "html2haml", "jeweler", "prettify_json.rb", "rackup", "rake", "rcov", "rubyforge", "sass", "spec", "yard-graph", "yardoc", "yri"]
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "Gemfile",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "lib/sinatra_warden.rb",
     "lib/sinatra_warden/sinatra.rb",
     "sinatra_warden.gemspec",
     "spec/fixtures/basic_strategy.rb",
     "spec/fixtures/testing_login.rb",
     "spec/fixtures/user.rb",
     "spec/fixtures/views/login.haml",
     "spec/sinatra_warden_spec.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/jsmestad/sinatra_warden}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{authentication system for using warden with sinatra}
  s.test_files = [
    "spec/fixtures/basic_strategy.rb",
     "spec/fixtures/testing_login.rb",
     "spec/fixtures/user.rb",
     "spec/sinatra_warden_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<sinatra>, [">= 0.9.4"])
      s.add_runtime_dependency(%q<warden>, [">= 0.5.0"])
    else
      s.add_dependency(%q<sinatra>, [">= 0.9.4"])
      s.add_dependency(%q<warden>, [">= 0.5.0"])
    end
  else
    s.add_dependency(%q<sinatra>, [">= 0.9.4"])
    s.add_dependency(%q<warden>, [">= 0.5.0"])
  end
end

