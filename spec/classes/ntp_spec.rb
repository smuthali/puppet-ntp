require 'spec_helper'

describe package('ntp') do
	it { should be_installed }
end

describe service('ntp') do
	it { should be_enabled }
	it { should be_running }

end

describe file('/etc/ntp.conf') do
	it { should be_file }
	[ 'Debian', 'Ubuntu' ].each do |operatingsystem|
		its(:content) { should match /server [0-9].ubuntu.pool.ntp.org/ }
	end
	[ 'RedHat', 'CentOS'].each do |operatingsystem|
		its(:content) { should match /server [0-9].rhel.pool.ntp.org/ }
	end
	[].each do |operatingsystem|
		its(:content) { should match /server [0-9].pool.ntp.org/ }
	end
end