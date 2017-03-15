directory '/srv/scrapod' do
  owner node['deploy_user']
  group node['deploy_group']
  mode '0755' # drwxr-xr-x
end
