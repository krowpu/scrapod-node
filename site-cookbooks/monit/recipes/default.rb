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

  subscribes :restart, 'cookbook_file[/etc/monit/monitrc]'

  subscribes :restart, 'cookbook_file[/etc/monit/conf-available/system]'
  subscribes :restart, 'cookbook_file[/etc/monit/conf-available/rootfs]'

  subscribes :restart, 'cookbook_file[/etc/monit/conf-enabled/system]'
  subscribes :restart, 'cookbook_file[/etc/monit/conf-enabled/rootfs]'
end

cookbook_file '/etc/nginx/snippets/monit.conf' do
  source 'nginx.conf'
  owner 'root'
  group 'root'
  mode '0644' # -rw-r--r--
end

service 'nginx' do
  action :nothing
  subscribes :restart, 'cookbook_file[/etc/nginx/snippets/monit.conf]'
end
