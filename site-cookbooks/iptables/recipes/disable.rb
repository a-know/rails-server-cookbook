%w(iptables ip6tables).each do |s|
  service s do
    action [ :disable, :stop ]
  end
end
