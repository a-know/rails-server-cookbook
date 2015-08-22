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
