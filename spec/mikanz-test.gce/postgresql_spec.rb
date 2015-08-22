require 'spec_helper'

describe package 'postgresql-devel' do
  it { should be_installed }
  it { should be_installed.with_version '9.2.13' }
end
