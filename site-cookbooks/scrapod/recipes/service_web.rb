include_recipe 'scrapod::directories'

template 'web.service' do
  path '/etc/systemd/system/scrapod-web.service'
  source 'web.service.erb'
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
  subscribes :run, 'template[web.service]'
end
