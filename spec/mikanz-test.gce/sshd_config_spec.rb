# sshd_config settings
describe file("/etc/ssh/sshd_config") do
  # deny root login
  its(:content) { should match(/^PermitRootLogin no$/) }
  # deny empty password
  its(:content) { should match(/^PermitEmptyPasswords no$/) }
  # deny password authentication
  its(:content) { should match(/^PasswordAuthentication no$/) }
  # deny challenge response authentication
  its(:content) { should match(/^ChallengeResponseAuthentication no$/) }
end