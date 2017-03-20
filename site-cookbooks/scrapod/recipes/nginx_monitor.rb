include_recipe 'nginx'
include_recipe 'monit'

cookbook_file '/etc/nginx/sites-available/monitor' do
  source 'nginx_monitor.conf'
  owner 'root'
  group 'root'
  mode '0644' # -rw-r--r--
end

link '/etc/nginx/sites-enabled/monitor' do
  to '/etc/nginx/sites-available/monitor'
  owner 'root'
  group 'root'
end

service 'nginx' do
  action :nothing
  subscribes :restart, 'cookbook_file[/etc/nginx/sites-available/monitor]'
  subscribes :restart, 'link[/etc/nginx/sites-enabled/monitor]'
end
