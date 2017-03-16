include_recipe 'nginx'

execute 'apt-get update'

package 'monit'

cookbook_file '/etc/monit/monitrc' do
  source 'monitrc'
  owner 'root'
  group 'root'
  mode '0600' # -rw-------
end

service 'monit' do
  action :nothing
  subscribes :restart, 'cookbook_file[/etc/monit/monitrc]', :immediately
end

cookbook_file '/etc/nginx/sites-available/monit' do
  source 'nginx.conf'
  owner 'root'
  group 'root'
  mode '0644' # -rw-r--r--
end

link '/etc/nginx/sites-enabled/monit' do
  to '/etc/nginx/sites-available/monit'
  owner 'root'
  group 'root'
end

service 'nginx' do
  action :nothing
  subscribes :restart, 'cookbook_file[/etc/nginx/sites-available/monit]', :immediately
  subscribes :restart, 'link[/etc/nginx/sites-enabled/monit]',            :immediately
end
