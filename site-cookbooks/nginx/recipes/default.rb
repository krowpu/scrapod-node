include_recipe 'dist-update'

package 'nginx'

cookbook_file '/etc/nginx/sites-available/default' do
  action :delete
end

link '/etc/nginx/sites-enabled/default' do
  action :delete
end
