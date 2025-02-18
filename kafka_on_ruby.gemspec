# frozen_string_literal: true

require_relative "lib/kafka/on/ruby/version"

Gem::Specification.new do |spec|
  spec.name = "kafka_on_ruby"
  spec.version = Kafka::On::Ruby::VERSION
  spec.authors = ["Ahmad Albu-Eltyif"]
  spec.email = ["ahmadeltyif@gmail.com"]

  spec.summary = "This gem creates a micro ruby application to be used as Kafka workers"
  spec.description = "A Kafka worker pod for consuming, processing, and publishing results to databases."
  spec.homepage = "https://github.com/aeltyif/kafka_on_ruby"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/aeltyif/kafka_on_ruby"
  spec.metadata["changelog_uri"] = "https://github.com/aeltyif/kafka_on_ruby/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
