require 'spec_helper'

describe 'puppet-ntp' do
	describe 'for Debian, Ubuntu, RedHat and CentOS' do
		let (:facts) { {:operatingsystem => 'Debian'} }
		let (:facts) { {:operatingsystem => 'Ubuntu'} }
		let (:facts) { {:operatingsystem => 'RedHat'} }
		let (:facts) { {:operatingsystem => 'CentOS'} }

		it 'should include ntp' do
			should contain_package('ntp')
		end
	end
end

describe 'puppet-ntp' do
	describe 'for Debian and Ubuntu the NTP servers should match [0-9].ubuntu.pool.ntp.org' do
		let (:facts) { {:operatingsystem => 'Debian'} }
		let (:facts) { {:operatingsystem => 'Ubuntu'} }
		it do
		 should contain_file('/etc/ntp.conf').with({
			'content' => /server \d.ubuntu.pool.ntp.org/,
			})
			end 
	end

	describe 'for RedHat and CentOS the NTP servers should match [0-9].rhel.pool.ntp.org' do
		let (:facts) { {:operatingsystem => 'RedHat'} }
		let (:facts) { {:operatingsystem => 'CentOS'} }
		it do
			should contain_file('/etc/ntp.conf').with({
			'content' => /server \d.rhel.pool.ntp.org iburst/,
			})
		end
	end

	describe 'If custom NTP servers are specified then the system will use them' do
		let (:facts) { {:operatingsystem => 'RedHat'} }
		let (:facts) { {:operatingsystem => 'CentOS'} }
		let (:facts) { {:operatingsystem => 'Debian'} }
		let (:facts) { {:operatingsystem => 'Ubuntu'} }
		it do
			should contain_file('/etc/ntp.conf').with({
			'content' => /server \d/, 
			})
		end
	end
	
end
