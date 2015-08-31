#
# Cookbook Name:: nginx_settings
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'nginx'

directory "/var/www/#{node[:nginx_settings][:application_name]}" do
  owner 'a-know'
  action :create
  recursive true
end

template '/etc/nginx/sites-available/default' do
  action :create
  source 'default.conf.erb'
  notifies :reload, 'service[nginx]'
end
