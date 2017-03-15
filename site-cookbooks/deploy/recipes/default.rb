include_recipe 'dist-update'

include_recipe 'deploy::ruby_bundler'
include_recipe 'deploy::directories'
