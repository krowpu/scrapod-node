include_recipe 'nginx'
include_recipe 'monit'

directory '/srv/www' do
  owner node['deploy']['user']
  group node['deploy']['group']
  mode '0755' # drwxr-xr-x
end

directory '/srv/www/html' do
  owner node['deploy']['user']
  group node['deploy']['group']
  mode '0755' # drwxr-xr-x
end

cookbook_file '/srv/www/html/index.html' do
  source 'index.html'
  owner node['deploy']['user']
  group node['deploy']['group']
  mode '0644' # -rw-r--r--
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
  subscribes :restart, 'cookbook_file[/etc/nginx/sites-available/default]', :immediately
  subscribes :restart, 'link[/etc/nginx/sites-enabled/default]',            :immediately
end
