# frozen_string_literal: true

require_relative "kafka_on_ruby/version"
require_relative "kafka_on_ruby/cli"

module KafkaOnRuby
  class Generator
    def self.create_project(project_name)
      Dir.mkdir(project_name)

      # Create subdirectories and files
      Dir.chdir(project_name) do
        Dir.mkdir("app")
        Dir.mkdir("config")
        Dir.mkdir("lib")

        # Example: Create a README file
        File.open("README.md", "w") do |file|
          file.write("# #{project_name}\n\nThis is a generated project.")
        end

        # Example: Create a basic configuration file
        File.open("config/application.rb", "w") do |file|
          file.write("module #{project_name.capitalize}\n  class Application\n  end\nend")
        end
      end

      puts "Project '#{project_name}' created successfully!"
    end
  end
end
