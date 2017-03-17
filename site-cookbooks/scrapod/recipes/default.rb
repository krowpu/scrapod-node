include_recipe 'ruby-bundler'

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
include_recipe 'scrapod::service_graphs'
