#
# Cookbook Name:: mybackupagent
# Recipe:: unicorn
#
# Copyright (C) 2015 Jeremy Ward
#
# All rights reserved - Do Not Redistribute
#

app_path = "#{node['mybackupagent']['app_path']}"

template "#{app_path}/shared/config/unicorn.rb" do
  source "unicorn_config.erb"
  variables :app_path => "#{app_path}"
  owner node['mybackupagent']['user']
end

template "/etc/init.d/unicorn_#{node['mybackupagent']['app_name']}" do
  source "unicorn_init.erb"
  variables :app_path => "#{app_path}"
  owner node['mybackupagent']['user']
  group node['mybackupagent']['group']
  mode "0755"
end

# add init script link
execute "update-rc.d unicorn_#{node['mybackupagent']['app_name']} defaults" do
  not_if "ls /etc/rc2.d | grep unicorn_#{node['app']}"
end