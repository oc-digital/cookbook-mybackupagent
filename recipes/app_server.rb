#
# Cookbook Name:: mybackupagent
# Recipe:: app_server
#
# Copyright (C) 2015 Jeremy Ward
#
# All rights reserved - Do Not Redistribute
#

package 'graphicsmagick-libmagick-dev-compat'
package 'imagemagick'
package 'libmagickwand-dev'

include_recipe "mybackupagent::app_setup"
include_recipe "mybackupagent::nginx"
include_recipe "mybackupagent::sidekiq"
include_recipe "mybackupagent::unicorn"