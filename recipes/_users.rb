#
# Cookbook Name:: mybackupagent
# Recipe:: users
#

include_recipe "sudo"

user node['mybackupagent']['user'] do
  group node['mybackupagent']['group']
  password node['mybackupagent']['password']
  system true
  home "#{node['mybackupagent']['home_dir']}"
  supports manage_home: true
  shell '/bin/bash'
end

template "#{node['mybackupagent']['home_dir']}/.bashrc" do
  source "bashrc.erb"
  owner node['mybackupagent']['user']
end

sudo 'ocd' do
  user      "ocd"    # or a username
  nopasswd true
  commands  node['mybackupagent']['no_password_cmds']
end

directory "#{node['mybackupagent']['home_dir']}/app" do
  owner node['mybackupagent']['user']
end

directory "#{node['mybackupagent']['home_dir']}/.ssh" do
  owner node['mybackupagent']['user']
  mode "0700"
end

if node['mybackupagent']['ssh_keys']
  template "#{node['mybackupagent']['home_dir']}/.ssh/authorized_keys" do
    source "authorized_keys.erb"
    owner node['mybackupagent']['user']
    mode "0600"
    variables :ssh_keys => node['mybackupagent']['ssh_keys']
  end
end
