package "postgresql" do
  action :install
end

package "postgresql-server" do
  action :install
end

package "postgresql-devel" do
  action :install
end

service "postgresql" do
  action [:enable]
  supports :start => true
end

execute "postgrosql-init" do
  not_if "test -f /var/lib/pgsql/data/postgresql.conf"
  command "service postgresql initdb"
  action :run
  notifies :start, 'service[postgresql]'
end
