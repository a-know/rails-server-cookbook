describe iptables do
  it { should have_rule('-P INPUT DROP') }
  it { should have_rule('-P INPUT DROP').with_table('filter').with_chain('INPUT') }
  it { should have_rule('--in-interface lo') }
end