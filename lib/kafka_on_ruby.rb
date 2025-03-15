# frozen_string_literal: true

require "thor"

module KafkaOnRuby
  class Generator < Thor::Group
    include Thor::Actions

    argument :project_name, type: :string

    def self.source_root
      File.expand_path("../../templates", __dir__)
    end

    def create_project_structure
      empty_directory project_name
      inside project_name do
        create_directories
        generate_files
      end
      puts "Project '#{project_name}' created successfully!"
    end

    private

    def create_directories
      %w[app config lib docker tmp].each { |dir| empty_directory dir }
      inside "config" do
        empty_directory "initializers"
      end
      inside "lib" do
        %w[schemas scripts connector_definitions].each { |dir| empty_directory dir }
      end
    end

    def generate_files
      template "docker-compose.yml.tt", "docker-compose.yml"
      create_file "README.md", "# #{project_name}\n\nThis is a generated project."
      create_file "config/constants.rb", "constants #{project_name.capitalize}"
      create_file "config/boot.rb", "boot #{project_name.capitalize}"
      create_env_file
    end

    def create_env_file
      create_file ".env.sample", <<~ENV
        APP_ENV=development
        KAFKA_SERVERS=localhost:29092
        KAFKA_USERNAME=consumer
        KAFKA_PASSWORD=secret
        SCHEMA_URL=http://localhost:8089
        SCHEMA_USERNAME=consumer
        SCHEMA_PASSWORD=secret
      ENV
    end
  end
end
