include_recipe 'deploy::directories'

template '/etc/systemd/system/capybara-webkit-daemon.service' do
  source 'capybara-webkit-daemon.service.erb'
  owner 'root'
  group 'root'
  mode '0644' # -rw-r--r--

  variables(
    user: node['deploy']['user'],
    group: node['deploy']['group'],
    display: node['xvfb']['display'],
  )

  notifies :run, 'execute[systemctl daemon-reload]', :immediately
end

execute 'systemctl daemon-reload' do
  action :nothing
end
