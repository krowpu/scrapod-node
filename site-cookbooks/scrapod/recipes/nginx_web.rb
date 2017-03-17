include_recipe 'nginx'
include_recipe 'monit'

cookbook_file '/etc/nginx/sites-available/www' do
  source 'nginx_web.conf'
  owner 'root'
  group 'root'
  mode '0644' # -rw-r--r--
end

link '/etc/nginx/sites-enabled/www' do
  to '/etc/nginx/sites-available/www'
  owner 'root'
  group 'root'
end

service 'nginx' do
  action :nothing
  subscribes :restart, 'cookbook_file[/etc/nginx/sites-available/www]'
  subscribes :restart, 'link[/etc/nginx/sites-enabled/www]'
end
