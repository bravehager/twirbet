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

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/bravehager/twirbet"
  spec.metadata["changelog_uri"] = "https://github.com/bravehager/twirbet/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    %x(git ls-files -z).split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
