#
# Cookbook Name:: sudoers
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

cookbook_file '/etc/sudoers' do
  source 'sudoers'
  owner 'root'
  group 'root'
  mode 0440
  action :create
end