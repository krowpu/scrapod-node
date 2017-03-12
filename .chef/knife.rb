cookbook_path    %w(cookbooks site-cookbooks)
node_path        'nodes'
role_path        'roles'
environment_path 'environments'
data_bag_path    'data_bags'

knife[:berkshelf_path] = 'cookbooks'

Chef::Config[:ssl_verify_mode] = :verify_peer if defined? ::Chef
