#
# Cookbook Name:: mybackupagent
# Recipe:: _common_packages
#

include_recipe "apt"

common_packages = %w{
  autoconf
  automake
  bison
  build-essential
  curl
  git-core
  g++
  libc6-dev
  libffi-dev
  libgdbm-dev
  libmagickwand-dev
  libncurses5-dev
  libpq5
  libpq-dev
  libreadline6-dev
  libsqlite3-dev
  libssl-dev
  libtool
  libv8-dev
  libxml2-dev
  libxslt1-dev
  libyaml-dev
  make
  memcached
  openssl
  pkg-config
  sqlite3
  software-properties-common
  subversion
  tree
  zlib1g
  zlib1g-dev
}

common_packages.each do |pkg|
  package pkg do
    action :install
  end
end
