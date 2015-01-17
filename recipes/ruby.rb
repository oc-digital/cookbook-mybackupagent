#
# Cookbook Name:: mybackupagent
# Recipe:: ruby
#
# Copyright (C) 2015 Jeremy Ward
#
# All rights reserved - Do Not Redistribute
#

include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"

node["mybackupagent"]["ruby"]["versions"].each do |rb_version|

  rbenv_ruby rb_version do
    global(node["mybackupagent"]["ruby"]["global_version"] == rb_version)
  end

  rbenv_gem "bundler" do
    ruby_version rb_version
  end

end