include_recipe 'dist-update'

package 'qt5-default'
package 'libqt5webkit5-dev'
package 'gstreamer1.0-plugins-base'
package 'gstreamer1.0-tools'
package 'gstreamer1.0-x'

include_recipe 'deploy::ruby_bundler'
include_recipe 'deploy::directories'
