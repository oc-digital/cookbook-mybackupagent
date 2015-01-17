#
# Cookbook Name:: mybackupagent
# Recipe:: default
#
# Copyright (C) 2015 Jeremy Ward
#
# All rights reserved - Do Not Redistribute
#

include_recipe "mybackupagent::_common_packages"
include_recipe "mybackupagent::_users"
include_recipe "mybackupagent::_common_security"
include_recipe "nodejs::nodejs_from_source"
include_recipe "mybackupagent::ruby"
package 'rubygems'