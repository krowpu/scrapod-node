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
