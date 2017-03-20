include_recipe 'deploy'
include_recipe 'scrapod::nginx_monitor'

template 'monitor.service' do
  path '/etc/systemd/system/scrapod-monitor.service'
  source 'monitor.service.erb'
  owner 'root'
  group 'root'
  mode '0644' # -rw-r--r--

  variables(
    user:  node['deploy']['user'],
    group: node['deploy']['group'],
  )
end

execute 'systemctl daemon-reload' do
  action :nothing
  subscribes :run, 'template[monitor.service]'
end
