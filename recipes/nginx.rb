#
# Cookbook Name:: mybackupagent
# Recipe:: nginx
#
# Copyright (C) 2015 Jeremy Ward
#
# All rights reserved - Do Not Redistribute
#

# include_recipe "mybackupagent::ssl"

package "nginx"

file "/etc/nginx/sites-enabled/default" do
  action :delete
end

# start nginx
# service "nginx" do
#   supports [:status, :restart]
#   action :stop
# end

template "/etc/nginx/sites-enabled/#{node['mybackupagent']['app_name']}" do
  source "nginx_conf.erb"
  owner node['mybackupagent']['user']
  group node['mybackupagent']['group']
  variables :app_path => "#{node['mybackupagent']['app_path']}"
  # notifies :restart, "service[nginx]", :delayed
end
