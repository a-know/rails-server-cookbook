describe 'iptables' do
  describe service 'iptables' do
    it { should_not be_enabled }
    it { should_not be_running }
  end

  describe service 'ip6tables' do
    it { should_not be_enabled }
    it { should_not be_running }
  end
end