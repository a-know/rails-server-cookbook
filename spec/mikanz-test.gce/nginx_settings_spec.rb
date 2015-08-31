describe file '/etc/nginx/sites-available/default' do
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 644 }
  its(:content) { should match %r(server_name +mikanz-test-gce;) }
  its(:content) { should match %r(root +/var/www/mikanz-test/current/public;) }
  its(:content) { should match %r(access_log +/var/log/nginx/mikanz-test-gce.access.log;) }
  its(:content) { should match %r(error_log +/var/log/nginx/mikanz-test-gce.error.log;) }
  its(:content) { should match %r(client_max_body_size +10m;) }
  its(:content) { should match %r(proxy_pass +http://mikanz-test;) }
end
