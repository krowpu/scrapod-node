cookbook_file 'graphs.service' do
  action :delete
  path '/etc/systemd/system/scrapod-graphs.service'
end

execute 'systemctl daemon-reload' do
  action :nothing
  subscribes :run, 'template[graphs.service]'
end
