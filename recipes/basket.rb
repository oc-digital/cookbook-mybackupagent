#
# Cookbook Name:: mybackupagent
# Recipe:: basket
#
# Copyright (C) 2015 Jeremy Ward
#
# All rights reserved - Do Not Redistribute
#

include_recipe "mybackupagent::database_server"
include_recipe "mybackupagent::app_server"