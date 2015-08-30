#
# Cookbook Name:: iptables
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'simple_iptables'

# 基本的に INPUT は DROP する
simple_iptables_policy 'INPUT' do
  policy 'DROP'
end

# ループバックは許可する
simple_iptables_rule 'local' do
  rule '--in-interface lo'
  jump 'ACCEPT'
end

# 既に接続済みのものは許可する
simple_iptables_rule 'established' do
  rule '-m conntrack --ctstate ESTABLISHED,RELATED'
  jump 'ACCEPT'
end

# ssh は許可
simple_iptables_rule 'ssh' do
  rule '--proto tcp --dport 22'
  jump 'ACCEPT'
end

# HTTP, HTTPS は許可
simple_iptables_rule 'http' do
  rule [ '--proto tcp --dport 80', '--proto tcp --dport 443' ]
  jump 'ACCEPT'
end
