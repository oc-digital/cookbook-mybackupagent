#
# Cookbook Name:: mybackupagent
# Recipe:: sidekiq
#
# Copyright (C) 2015 Jeremy Ward
#
# All rights reserved - Do Not Redistribute
#

template "etc/init/sidekiq.conf" do
  source "sidekiq_conf.erb"
  variables({
    :app_path => "#{node['mybackupagent']['app_path']}",
    :user => "#{node['mybackupagent']['user']}"
  })
end