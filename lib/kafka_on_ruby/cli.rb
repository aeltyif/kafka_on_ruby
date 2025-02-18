# frozen_string_literal: true

require "thor"
require "kafka_on_ruby"

module KafkaOnRuby
  class CLI < Thor
    desc "new PROJECT_NAME", "Create a new project"
    def new(project_name)
      Generator.create_project(project_name)
    end
  end
end
