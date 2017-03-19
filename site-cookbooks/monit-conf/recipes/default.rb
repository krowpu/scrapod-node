include_recipe 'monit'

service 'monit' do
  action :nothing
end

cookbook_file '/etc/monit/conf-available/redis-server' do
  source 'redis-server'
  owner 'root'
  group 'root'
  mode '0644' # -rw-r--r--

  notifies :restart, 'service[monit]'
end

link '/etc/monit/conf-enabled/redis-server' do
  to '/etc/monit/conf-available/redis-server'
  owner 'root'
  group 'root'

  notifies :restart, 'service[monit]'
end

cookbook_file '/etc/monit/conf-available/scrapod-web' do
  source 'scrapod-web'
  owner 'root'
  group 'root'
  mode '0644' # -rw-r--r--

  notifies :restart, 'service[monit]'
end

link '/etc/monit/conf-enabled/scrapod-web' do
  to '/etc/monit/conf-available/scrapod-web'
  owner 'root'
  group 'root'

  notifies :restart, 'service[monit]'
end

cookbook_file '/etc/monit/conf-available/scrapod-capybara' do
  source 'scrapod-capybara'
  owner 'root'
  group 'root'
  mode '0644' # -rw-r--r--

  notifies :restart, 'service[monit]'
end

link '/etc/monit/conf-enabled/scrapod-capybara' do
  to '/etc/monit/conf-available/scrapod-capybara'
  owner 'root'
  group 'root'

  notifies :restart, 'service[monit]'
end
