#
# Cookbook Name:: selinux-policies
# Recipe:: unicorn
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

unicorn_policy_file = 'unicorn.pp'
unicorn_policy_path = File.join('/var/tmp', unicorn_policy_file)

cookbook_file unicorn_policy_path do
  user     'root'
  group    'root'
  mode     0600
  source   unicorn_policy_file
  not_if   "semodule -l | egrep \"unicorn\\s\*1.0\""
  notifies :run, 'execute[change SELinux policy for unicorn]', :immediately
end

execute "change SELinux policy for unicorn" do
  user "root"
  command "semodule -i #{unicorn_policy_path}"
  action :nothing
end
