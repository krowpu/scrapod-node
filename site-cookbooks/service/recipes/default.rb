include_recipe 'deploy'

directory '/srv/scrapod/shared' do
  owner node['deploy_user']
  group node['deploy_user']
  mode '0755' # drwxr-xr-x
end

directory '/srv/scrapod/shared/tmp' do
  owner node['deploy_user']
  group node['deploy_user']
  mode '0755' # drwxr-xr-x
end

directory '/srv/scrapod/shared/tmp/pids' do
  owner node['deploy_user']
  group node['deploy_user']
  mode '0755' # drwxr-xr-x
end

template '/etc/systemd/system/capybara-webkit-daemon.service' do
  source 'capybara-webkit-daemon.service.erb'
  owner 'root'
  group 'root'
  mode '0644' # -rw-r--r--

  notifies :run, 'execute[systemctl daemon-reload]', :immediately
end

execute 'systemctl daemon-reload' do
  action :nothing
end
