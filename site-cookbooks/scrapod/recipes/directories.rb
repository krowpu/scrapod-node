include_recipe 'deploy'

directory '/deploy/shared/tmp/graphs' do
  path File.join node['deploy']['to'], 'shared/tmp/graphs'
  owner node['deploy']['user']
  group node['deploy']['group']
  mode '0755' # drwxr-xr-x
end
