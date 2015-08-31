require 'spec_helper'

describe package 'postgresql' do
  it { should be_installed }
  it { should be_installed.with_version '9.2.13' }
end

describe package 'postgresql-devel' do
  it { should be_installed }
  it { should be_installed.with_version '9.2.13' }
end

describe package 'postgresql-server' do
  it { should be_installed }
  it { should be_installed.with_version '9.2.13' }
end

describe service 'postgresql' do
  it { should be_enabled }
  it { should be_running }
end

describe file '/var/lib/pgsql/data/pg_hba.conf' do
  it { should be_owned_by 'postgres' }
  it { should be_grouped_into 'postgres' }
  it { should be_mode 600 }
  its(:content) { should match /^local\s+all\s+all\s+md5/ }
end
