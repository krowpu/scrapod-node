include_recipe 'scrapod::directories'

include_recipe 'xvfb'

template 'capybara.service' do
  path '/etc/systemd/system/scrapod-capybara.service'
  source 'capybara.service.erb'
  owner 'root'
  group 'root'
  mode '0644' # -rw-r--r--

  variables(
    user:    node['deploy']['user'],
    group:   node['deploy']['group'],
    display: node['xvfb']['display'],
  )
end

execute 'systemctl daemon-reload' do
  action :nothing
  subscribes :run, 'template[capybara.service]'
end
