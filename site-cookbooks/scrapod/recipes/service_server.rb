include_recipe 'deploy'
include_recipe 'redis'

include_recipe 'xvfb'

template 'server.service' do
  path '/etc/systemd/system/scrapod-server.service'
  source 'server.service.erb'
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
  subscribes :run, 'template[server.service]'
end
