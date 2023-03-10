# frozen_string_literal: true

require_relative "lib/twirbet/version"

Gem::Specification.new do |spec|
  spec.name = "twirbet"
  spec.version = Twirbet::VERSION
  spec.authors = ["Brave Hager"]
  spec.email = ["bravehager7@gmail.com"]

  spec.summary = "A Sorbet-friendly Ruby library for Twirp"
  spec.homepage = "https://github.com/bravehager/twirbet"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/bravehager/twirbet"
  spec.metadata["changelog_uri"] = "https://github.com/bravehager/twirbet/blob/main/CHANGELOG.md"

  spec.files = Dir.glob("lib/**/*.rb") + ["README.md", "LICENSE.txt"]
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency("google-protobuf", "~> 3.21")
  spec.add_dependency("rack", "~> 3.0")
  spec.add_dependency("sorbet-runtime", "~> 0.5.10595")
end
