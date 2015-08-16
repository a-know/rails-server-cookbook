require 'spec_helper'

describe package 'nodejs' do
  it { should be_installed }
end

describe package 'nodejs-devel' do
  it { should be_installed }
end

describe package 'npm' do
  it { should be_installed }
end
