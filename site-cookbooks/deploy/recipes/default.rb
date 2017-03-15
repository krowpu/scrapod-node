execute 'apt-get update'

package 'ruby-full'
package 'bundler'

package 'qt5-default'
package 'libqt5webkit5-dev'
package 'gstreamer1.0-plugins-base'
package 'gstreamer1.0-tools'
package 'gstreamer1.0-x'

include_recipe 'deploy::directories'
include_recipe 'deploy::service'
