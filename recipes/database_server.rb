#
# Cookbook Name:: mybackupagent
# Recipe:: database_server
#
# Copyright (C) 2015 Jeremy Ward
#
# All rights reserved - Do Not Redistribute
#

include_recipe "redisio::install"

# defaults to v9.4
include_recipe 'postgresql::server'
include_recipe 'postgresql::postgis'

db_extensions = %w[hstore unaccent pg_trgm]

postgresql_user "#{node["mybackupagent"]["app_name"]}" do
  superuser false
  createdb false
  login true
  replication false
  password "#{node["mybackupagent"]["db_password"]}"
end

postgresql_database "#{node["mybackupagent"]["db_name"]}" do
  owner "#{node["mybackupagent"]["app_name"]}"
  encoding "UTF-8"
  template "template0"
  locale "en_US.UTF-8"
end

db_extensions.each do |ext|
  postgresql_extension ext do
    database "#{node["mybackupagent"]["db_name"]}"
  end
end
