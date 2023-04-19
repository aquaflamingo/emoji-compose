# frozen_string_literal: true

require_relative "lib/emoji_compose/version"

Gem::Specification.new do |spec|
  spec.name = "emoji_compose"
  spec.version = EmojiCompose::VERSION
  spec.authors = ["aquaflamingo"]
  spec.email = ["16901597+aquaflamingo@users.noreply.github.com"]
spec.summary = "Terraform for Slack Emojis"
  spec.description = "Terraform for Slack Emojis"
  spec.homepage = "https://github.com/aquaflamingo/emoji-compose"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/aquaflamingo/emoji-compose"
  spec.metadata["changelog_uri"] = "https://github.com/aquaflamingo/emoji-compose"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'slack-ruby-client'
  spec.add_dependency "thor"
  spec.add_development_dependency 'pry'

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
