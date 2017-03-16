# frozen_string_literal: true

# Load custom tasks from `lib/tasks` if you have any defined
Dir.glob('lib/tasks/*.rake').each { |r| import r }

task default: :lint

task lint: :rubocop

task fix: 'rubocop:auto_correct'

begin
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new
rescue LoadError # rubocop:disable Lint/HandleExceptions
end
