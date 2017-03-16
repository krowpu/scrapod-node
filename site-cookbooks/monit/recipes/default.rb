include_recipe 'dist-update'

include_recipe 'nginx'

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

cookbook_file '/etc/nginx/snippets/monit.conf' do
  source 'nginx.conf'
  owner 'root'
  group 'root'
  mode '0644' # -rw-r--r--
end

service 'nginx' do
  action :nothing
  subscribes :restart, 'cookbook_file[/etc/nginx/snippets/monit.conf]', :immediately
end
