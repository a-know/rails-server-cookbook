require 'spec_helper'

describe user 'a-know' do
  it { should exist }
  it 'should have authorized key of inoue' do
    should have_authorized_key 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC/ZZ0rIx+tWsWi7GbFZYkbUkQascXY5p9K/DKx3vRqANXp4YNkqLlkhI2oJIfMCcjWoUJI1aZSOp+T9hx5jo/R46EnzZAtAnzXENgK9sqolJk08bTGOaGOqIKUk7i+HXVet8CEUiv6xczuo61zZYrjr0TmVZAmPY03fiFpt6YJ+oDiv9aKkDhzFiPjnIP0pq1gxVu4deyA4/oPYkpJFxmbphF+0BjCViaStSGmQfZH7W6TqUGJ2QJVi3xC86PbYjZven/8phNbSS9ief+P62mFz9CfLmseCMIg3NiSFi19DrxqMgYYfIcfI6MbOdG/SWp04Fwg82Mx54uylUrLKQxt a-know@a-know-no-MacBook-Pro.local
'
  end
end
