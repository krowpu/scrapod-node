include_recipe 'dist-update'

package 'qt5-default'
package 'libqt5webkit5-dev'
package 'gstreamer1.0-plugins-base'
package 'gstreamer1.0-tools'
package 'gstreamer1.0-x'

package 'rrdtool'

include_recipe 'scrapod::service_web'
include_recipe 'scrapod::service_capybara'

directory '/deploy/shared/tmp/graphs' do
  path File.join node['deploy']['to'], 'shared/tmp/graphs'
  owner node['deploy']['user']
  group node['deploy']['group']
  mode '0755' # drwxr-xr-x
end

cron 'graphs' do
  command '/usr/bin/bundle exec /srv/scrapod/current/bin/graphs >>/srv/scrapod/shared/log/graphs.log 2>&1'
  environment 'BUNDLE_GEMFILE' => '/srv/scrapod/current/Gemfile'
end
