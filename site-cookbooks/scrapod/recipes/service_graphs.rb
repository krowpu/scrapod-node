include_recipe 'scrapod::directories'

cookbook_file 'graphs.service' do
  path '/etc/systemd/system/scrapod-graphs.service'
  source 'graphs.service'
  owner 'root'
  group 'root'
  mode '0644' # -rw-r--r--
end

execute 'systemctl daemon-reload' do
  action :nothing
  subscribes :run, 'template[graphs.service]'
end
