#
# Cookbook Name:: postgresql
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'sudoers'

rpm_filename = "pgdg-centos94-9.4-1.noarch.rpm"
rpm_path = "/usr/local/src/#{rpm_filename}"

remote_file rpm_path do
  source "http://yum.postgresql.org/9.4/redhat/rhel-7-x86_64/#{rpm_filename}"
end

rpm_package 'postgresql-release' do
  source rpm_path
end

cookbook_file '/etc/yum.repos.d/CentOS-Base.repo' do
  source 'CentOS-Base.repo'
  owner 'root'
  group 'root'
  mode 0644
end

package 'postgresql94-server'

package 'postgresql94-devel'

execute "postgresql-init" do
  command "sudo /usr/pgsql-9.4/bin/postgresql94-setup initdb"
  not_if { File.exists?('/var/lib/pgsql/9.4/data/postgresql.conf') }
end

service "postgresql-9.4" do
  action [:enable, :restart, :reload]
end

cookbook_file '/var/lib/pgsql/9.4/data/pg_hba.conf' do
  source 'pg_hba.conf'
  owner 'postgres'
  group 'postgres'
  mode 0600
  notifies :reload, 'service[postgresql-9.4]'
end

cookbook_file '/var/lib/pgsql/9.4/data/postgresql.conf' do
  source 'postgresql.conf'
  owner 'postgres'
  group 'postgres'
  mode 0600
  notifies :restart, 'service[postgresql-9.4]', :immediately
end

execute "create-role" do
    exists = <<-EOH
        su - postgres -c "psql -c\\"SELECT * FROM pg_user WHERE usename='#{node[:postgresql][:user]}'\\" | grep -c #{node[:postgresql][:user]}"
    EOH
    command <<-EOC
        su - postgres -c "psql -c\\"CREATE USER #{node[:postgresql][:user]} WITH LOGIN PASSWORD '#{node[:postgresql][:password]}';\\""
    EOC
    not_if exists
end

execute "create-database" do
    exists = <<-EOH
        su - postgres -c "psql -c\\"SELECT * FROM pg_database WHERE datname = '#{node[:postgresql][:database_name]}'\\" | grep -c #{node[:postgresql][:database_name]}"
    EOH
    command <<-EOC
        su - postgres -c "psql -c\\"CREATE DATABASE #{node[:postgresql][:database_name]} WITH TEMPLATE = template0 ENCODING = 'UTF-8' LC_COLLATE = 'ja_JP.UTF-8' LC_CTYPE = 'ja_JP.UTF-8';\\""
        su - postgres -c "psql -c\\"GRANT ALL ON DATABASE #{node[:postgresql][:database_name]} TO #{node[:postgresql][:user]};\\""
    EOC
    not_if exists
end
