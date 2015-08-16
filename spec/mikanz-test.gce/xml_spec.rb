require 'spec_helper'

describe package 'libxml2-devel' do
  it { should be_installed }
end

describe package 'libxslt-devel' do
  it { should be_installed }
end
