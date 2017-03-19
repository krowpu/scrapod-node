include_recipe 'deploy'
include_recipe 'redis'

include_recipe 'dist-update'

package 'qt5-default'
package 'libqt5webkit5-dev'
package 'gstreamer1.0-plugins-base'
package 'gstreamer1.0-tools'
package 'gstreamer1.0-x'

package 'rrdtool'

include_recipe 'scrapod::directories'

include_recipe 'scrapod::service_web'
include_recipe 'scrapod::service_capybara'

cron 'graphs' do
  command '/usr/bin/bundle exec /srv/scrapod/current/bin/graphs >>/srv/scrapod/shared/log/graphs.log 2>&1'
  environment 'BUNDLE_GEMFILE' => '/srv/scrapod/current/Gemfile'
end
