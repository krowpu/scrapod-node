include_recipe 'nginx'
include_recipe 'monit'

cookbook_file '/etc/nginx/sites-available/web' do
  source 'nginx_web.conf'
  owner 'root'
  group 'root'
  mode '0644' # -rw-r--r--
end

link '/etc/nginx/sites-enabled/web' do
  to '/etc/nginx/sites-available/web'
  owner 'root'
  group 'root'
end

service 'nginx' do
  action :nothing
  subscribes :restart, 'cookbook_file[/etc/nginx/sites-available/web]'
  subscribes :restart, 'link[/etc/nginx/sites-enabled/web]'
end
