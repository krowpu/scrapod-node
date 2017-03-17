directory '/srv/scrapod' do
  owner node['deploy']['user']
  group node['deploy']['group']
  mode '0755' # drwxr-xr-x
end

directory '/srv/scrapod/shared' do
  owner node['deploy']['user']
  group node['deploy']['group']
  mode '0755' # drwxr-xr-x
end

directory '/srv/scrapod/shared/log' do
  owner node['deploy']['user']
  group node['deploy']['group']
  mode '0755' # drwxr-xr-x
end

directory '/srv/scrapod/shared/tmp' do
  owner node['deploy']['user']
  group node['deploy']['group']
  mode '0755' # drwxr-xr-x
end

directory '/srv/scrapod/shared/tmp/pids' do
  owner node['deploy']['user']
  group node['deploy']['group']
  mode '0755' # drwxr-xr-x
end

directory '/srv/scrapod/shared/tmp/sockets' do
  owner node['deploy']['user']
  group node['deploy']['group']
  mode '0755' # drwxr-xr-x
end

directory '/srv/scrapod/shared/tmp/graphs' do
  owner node['deploy']['user']
  group node['deploy']['group']
  mode '0755' # drwxr-xr-x
end
