namespace :capybara do
  task :enable do
    on roles :all do |_host|
      execute :sudo, 'systemctl enable capybara-webkit-daemon'
    end
  end

  task :restart do
    on roles :all do |_host|
      execute :sudo, 'systemctl restart capybara-webkit-daemon'
    end
  end
end
