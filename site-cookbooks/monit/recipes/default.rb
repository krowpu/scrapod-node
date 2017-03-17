include_recipe 'dist-update'

include_recipe 'nginx'

package 'monit'

cookbook_file '/etc/monit/monitrc' do
  source 'monitrc'
  owner 'root'
  group 'root'
  mode '0600' # -rw-------

  notifies :restart, 'service[monit]'
end

cookbook_file '/etc/monit/conf-available/system' do
  source 'system'
  owner 'root'
  group 'root'
  mode '0644' # -rw-r--r--

  notifies :restart, 'service[monit]'
end

link '/etc/monit/conf-enabled/system' do
  to '/etc/monit/conf-available/system'
  owner 'root'
  group 'root'

  notifies :restart, 'service[monit]'
end

cookbook_file '/etc/monit/conf-available/rootfs' do
  source 'rootfs'
  owner 'root'
  group 'root'
  mode '0644' # -rw-r--r--

  notifies :restart, 'service[monit]'
end

link '/etc/monit/conf-enabled/rootfs' do
  to '/etc/monit/conf-available/rootfs'
  owner 'root'
  group 'root'

  notifies :restart, 'service[monit]'
end

cookbook_file '/etc/monit/conf-available/sshd' do
  source 'sshd'
  owner 'root'
  group 'root'
  mode '0644' # -rw-r--r--

  notifies :restart, 'service[monit]'
end

link '/etc/monit/conf-enabled/sshd' do
  to '/etc/monit/conf-available/sshd'
  owner 'root'
  group 'root'

  notifies :restart, 'service[monit]'
end

cookbook_file '/etc/monit/conf-available/monit' do
  source 'monit'
  owner 'root'
  group 'root'
  mode '0644' # -rw-r--r--

  notifies :restart, 'service[monit]'
end

link '/etc/monit/conf-enabled/monit' do
  to '/etc/monit/conf-available/monit'
  owner 'root'
  group 'root'

  notifies :restart, 'service[monit]'
end

cookbook_file '/etc/monit/conf-available/nginx' do
  source 'nginx'
  owner 'root'
  group 'root'
  mode '0644' # -rw-r--r--

  notifies :restart, 'service[monit]'
end

link '/etc/monit/conf-enabled/nginx' do
  to '/etc/monit/conf-available/nginx'
  owner 'root'
  group 'root'

  notifies :restart, 'service[monit]'
end

cookbook_file '/etc/monit/conf-available/scrapod-web' do
  source 'scrapod-web'
  owner 'root'
  group 'root'
  mode '0644' # -rw-r--r--

  notifies :restart, 'service[monit]'
end

link '/etc/monit/conf-enabled/scrapod-web' do
  to '/etc/monit/conf-available/scrapod-web'
  owner 'root'
  group 'root'

  notifies :restart, 'service[monit]'
end

cookbook_file '/etc/monit/conf-available/scrapod-capybara' do
  source 'scrapod-capybara'
  owner 'root'
  group 'root'
  mode '0644' # -rw-r--r--

  notifies :restart, 'service[monit]'
end

link '/etc/monit/conf-enabled/scrapod-capybara' do
  to '/etc/monit/conf-available/scrapod-capybara'
  owner 'root'
  group 'root'

  notifies :restart, 'service[monit]'
end

service 'monit' do
  action :nothing
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
