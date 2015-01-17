#
# Cookbook Name:: mybackupagent
# Recipe:: app_setup
#
# Copyright (C) 2015 Jeremy Ward
#
# All rights reserved - Do Not Redistribute
#

app_path = "#{node['mybackupagent']['app_path']}"

directory app_path do
  owner node['mybackupagent']['user']
  group node['mybackupagent']['group']
end

directory "#{app_path}/shared" do
  owner node['mybackupagent']['user']
  group node['mybackupagent']['group']
end

directory "#{app_path}/shared/config" do
  owner node['mybackupagent']['user']
  group node['mybackupagent']['group']
end

directory "#{app_path}/shared/tmp" do
  owner node['mybackupagent']['user']
  group node['mybackupagent']['group']
end

directory "#{app_path}/shared/tmp/pids" do
  owner node['mybackupagent']['user']
  group node['mybackupagent']['group']
end

template "#{app_path}/shared/config/database.yml" do
  source "database_yml.erb"
  owner node['mybackupagent']['user']
  group node['mybackupagent']['group']
end

template "#{app_path}/shared/config/secrets.yml" do
  source "secrets_yml.erb"
  owner node['mybackupagent']['user']
  group node['mybackupagent']['group']
end

template "#{app_path}/shared/config/sidekiq.yml" do
  source "sidekiq_yml.erb"
  owner node['mybackupagent']['user']
  group node['mybackupagent']['group']
end