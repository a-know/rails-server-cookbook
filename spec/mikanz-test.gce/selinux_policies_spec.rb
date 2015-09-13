describe selinux do
  it { should be_enforcing }
end

describe command "semodule -l" do
  its(:stdout) { should match /unicorn\s+1.0/ }
end
