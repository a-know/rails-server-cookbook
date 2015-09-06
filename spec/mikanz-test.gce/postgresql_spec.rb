require 'spec_helper'

describe package 'postgresql94-devel' do
  it { should be_installed }
end

describe package 'postgresql94-server' do
  it { should be_installed }
end

describe service 'postgresql-9.4' do
  it { should be_enabled }
  it { should be_running }
end

describe file '/var/lib/pgsql/9.4/data/pg_hba.conf' do
  it { should be_owned_by 'postgres' }
  it { should be_grouped_into 'postgres' }
  it { should be_mode 600 }
  its(:content) { should match /^local\s+all\s+postgres\s+peer/ }
  its(:content) { should match /^local\s+all\s+all\s+md5/ }
  its(:content) { should match /^host\s+all\s+all\s+127.0.0.1\/32\s+md5/ }
  its(:content) { should match /^host\s+all\s+all\s+::1\/128\s+md5/ }
end

describe file '/var/lib/pgsql/9.4/data/postgresql.conf' do
  it { should be_owned_by 'postgres' }
  it { should be_grouped_into 'postgres' }
  it { should be_mode 600 }
  its(:content) { should match /^shared_buffers = 512MB/ }
end

describe command 'su - postgres -c "psql -c\"SELECT * FROM pg_user WHERE usename=\'mikan\'\""' do
  its(:stdout) { should include 'mikan' }
end

describe command 'su - postgres -c "psql -c\"SELECT * FROM pg_database WHERE datname = \'mikan_iaas\'\""' do
  its(:stdout) { should include 'mikan_iaas' }
end
