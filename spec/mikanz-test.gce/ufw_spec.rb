require 'spec_helper'

describe file '/usr/sbin/ufw' do
  it { should be_file }
end

describe command 'ufw status' do
  its(:stdout) { should include 'Status: active' }
end

describe command 'ufw status verbose' do
  its(:stdout) { should include 'Default: deny (incoming), allow (outgoing), disabled (routed)' }

  describe 'ssh' do
    its(:stdout) { should contain %r(^22 +ALLOW IN +Anywhere) }
  end

  describe 'http' do
    its(:stdout) { should contain %r(^80 +ALLOW IN +Anywhere) }
  end
end