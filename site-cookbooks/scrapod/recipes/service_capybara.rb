include_recipe 'scrapod::directories'

template 'capybara-webkit-daemon.service' do
  path '/etc/systemd/system/capybara-webkit-daemon.service'
  source 'capybara.service.erb'
  owner 'root'
  group 'root'
  mode '0644' # -rw-r--r--

  variables(
    user:    node['deploy']['user'],
    group:   node['deploy']['group'],
    display: node['xvfb']['display'],
  )
end

execute 'systemctl daemon-reload' do
  action :nothing
  subscribes :run, 'template[capybara-webkit-daemon.service]'
end
