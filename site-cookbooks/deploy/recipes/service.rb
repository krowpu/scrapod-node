include_recipe 'deploy'

template '/etc/systemd/system/capybara-webkit-daemon.service' do
  source 'capybara-webkit-daemon.service.erb'
  owner 'root'
  group 'root'
  mode '0644' # -rw-r--r--

  variables(
    display: node['display'],
  )

  notifies :run, 'execute[systemctl daemon-reload]', :immediately
end

execute 'systemctl daemon-reload' do
  action :nothing
end
