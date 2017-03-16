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

cookbook_file '/etc/nginx/sites-available/default' do
  source 'nginx.conf'
  owner 'root'
  group 'root'
  mode '0644' # -rw-r--r--
end

link '/etc/nginx/sites-enabled/default' do
  to '/etc/nginx/sites-available/default'
  owner 'root'
  group 'root'
end

service 'nginx' do
  action :nothing
  subscribes :restart, 'cookbook_file[/etc/nginx/sites-available/default]'
  subscribes :restart, 'link[/etc/nginx/sites-enabled/default]'
end
