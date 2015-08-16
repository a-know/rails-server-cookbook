require 'spec_helper'

describe package 'autoconf' do
  it { should be_installed }
end

describe package 'bison' do
  it { should be_installed }
end

describe package 'flex' do
  it { should be_installed }
end

describe package 'gcc' do
  it { should be_installed }
end

describe package 'gcc-c++' do
  it { should be_installed }
end

describe package 'kernel-devel' do
  it { should be_installed }
end

describe package 'make' do
  it { should be_installed }
end

describe package 'm4' do
  it { should be_installed }
end

describe package 'patch' do
  it { should be_installed }
end
