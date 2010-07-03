Gem::Specification.new do |s|
  s.name = "debugserver"
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dan Sosedoff"]
  s.date = %q{2010-07-01}
  s.default_executable = %q{debugserver}
  s.description = %q{Console server to provide debugging for web/any applications}
  s.email = %q{dan.sosedoff@gmail.com}
  s.executables = ["debugserver"]
  s.files = [
    "bin/debugserver",
    "lib/debugserver.rb",
    "lib/debugserver/common.rb",
    "lib/debugserver/parser.rb",
    "lib/debugserver/console.rb",
    "lib/debugserver/server.rb",
    "lib/debugserver/session.rb",
    "lib/debugserver/class_utils.rb"
  ]
  s.homepage = %q{http://sosedoff.com}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Console server to provide external debug log for applications over network}
  
  s.add_dependency("eventmachine", ["~> 0.12.10"])
  s.add_dependency("json_pure", ["~> 1.4.3"])
end

