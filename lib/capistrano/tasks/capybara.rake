# frozen_string_literal: true

namespace :capybara do
  task :enable do
    on roles :all do |_host|
      execute :sudo, 'systemctl enable scrapod-capybara'
    end
  end

  task :restart do
    on roles :all do |_host|
      execute :sudo, 'systemctl restart scrapod-capybara'
    end
  end
end
