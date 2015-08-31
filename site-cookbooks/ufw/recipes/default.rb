#
# Cookbook Name:: ufw
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'sudoers'

work_dir = '/usr/local/src'

cookbook_file "#{work_dir}/ufw-0.34.tar.gz" do
  action :create_if_missing
  notifies :run, 'bash[install ufw-0.34]', :immediately
end

bash 'install ufw-0.34' do
  action :nothing
  cwd work_dir
  code <<-EOC
  tar xzf ufw-0.34.tar.gz
  cd ufw-0.34
  sudo python ./setup.py install
  cd ../
  sudo rm -rf ufw-0.34
  sudo chmod -R g-w /etc/ufw /lib/ufw /etc/default/ufw /usr/sbin/ufw
  EOC
end

execute 'ufw reload' do
  action :nothing
end

execute 'ufw default deny' do
  not_if 'ufw status verbose | fgrep "Default: deny (incoming)"'
  notifies :run, 'execute[ufw reload]'
end

execute 'ufw allow http' do
  not_if 'ufw status | egrep "^80 +ALLOW"'
  notifies :run, 'execute[ufw reload]'
end

execute 'ufw allow ssh' do
  not_if 'ufw status | egrep "^22 +ALLOW"'
  notifies :run, 'execute[ufw reload]'
end

execute 'ufw enable' do
  command 'yes | ufw enable'
  not_if 'ufw status | fgrep "Status: active"'
end
