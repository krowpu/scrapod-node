include_recipe 'dist-update'

include_recipe 'nginx'

package 'monit'

cookbook_file '/etc/monit/monitrc' do
  source 'monitrc'
  owner 'root'
  group 'root'
  mode '0600' # -rw-------
end

cookbook_file '/etc/monit/conf-available/system' do
  source 'system'
  owner 'root'
  group 'root'
  mode '0644' # -rw-r--r--
end

link '/etc/monit/conf-enabled/system' do
  to '/etc/monit/conf-available/system'
  owner 'root'
  group 'root'
end

cookbook_file '/etc/monit/conf-available/rootfs' do
  source 'rootfs'
  owner 'root'
  group 'root'
  mode '0644' # -rw-r--r--
end

link '/etc/monit/conf-enabled/rootfs' do
  to '/etc/monit/conf-available/rootfs'
  owner 'root'
  group 'root'
end

service 'monit' do
  action :nothing

  subscribes :restart, 'cookbook_file[/etc/monit/monitrc]', :immediately

  subscribes :restart, 'cookbook_file[/etc/monit/conf-available/system]', :immediately
  subscribes :restart, 'cookbook_file[/etc/monit/conf-available/rootfs]', :immediately

  subscribes :restart, 'cookbook_file[/etc/monit/conf-enabled/system]', :immediately
  subscribes :restart, 'cookbook_file[/etc/monit/conf-enabled/rootfs]', :immediately
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
