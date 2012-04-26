# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "has_roles/version"

Gem::Specification.new do |s|
  s.name        = "has_roles"
  s.version     = HasRoles::VERSION
  s.authors     = ["alepaez"]
  s.email       = ["alepaezseq@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Adds roles to ActiveRecord Model}
  s.description = %q{Adds roles to ActiveRecord Model}

  s.rubyforge_project = "has_roles"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
