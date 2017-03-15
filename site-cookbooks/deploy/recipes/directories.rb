directory '/srv/scrapod' do
  owner node['deploy_user']
  group node['deploy_group']
  mode '0755' # drwxr-xr-x
end

directory '/srv/scrapod/shared' do
  owner node['deploy_user']
  group node['deploy_user']
  mode '0755' # drwxr-xr-x
end

directory '/srv/scrapod/shared/tmp' do
  owner node['deploy_user']
  group node['deploy_user']
  mode '0755' # drwxr-xr-x
end

directory '/srv/scrapod/shared/tmp/pids' do
  owner node['deploy_user']
  group node['deploy_user']
  mode '0755' # drwxr-xr-x
end
