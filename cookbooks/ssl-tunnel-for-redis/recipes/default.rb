#
# Cookbook Name:: ssl-tunnel-for-redis
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'redisio'
include_recipe 'redisio::enable'
include_recipe 'stunnel::server'

stunnel_connection 'redis' do
  accept 8888
  connect 6379
  notifies :restart, 'service[stunnel]'
end
