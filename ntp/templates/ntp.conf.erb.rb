<% if ntp_server_add == 'UNSET' -%>
	<% if @operatingsystem == 'Ubuntu' or @operatingsystem == 'Debian'-%>
		# Use servers from the NTP Pool Project. Approved by Ubuntu Technical Board
		# on 2011-02-08 (LP: #104525). See http://www.pool.ntp.org/join.html for
		# more information.
		server 0.ubuntu.pool.ntp.org
		server 1.ubuntu.pool.ntp.org
		server 2.ubuntu.pool.ntp.org
		server 3.ubuntu.pool.ntp.org
	<% elseif @operatingsystem == 'RedHat' or @operatingsystem == 'CentOS' -%>
		server 0.rhel.pool.ntp.org iburst
		server 1.rhel.pool.ntp.org iburst
		server 2.rhel.pool.ntp.org iburst
		server 3.rhel.pool.ntp.org iburst
	<% else -%>
		driftfile /var/lib/ntp/ntp.drift
		server 0.pool.ntp.org
		server 1.pool.ntp.org
		server 2.pool.ntp.org
		server 3.pool.ntp.org
	<% end -%>
<% else -%>
	server <%= ntp_server_add %> prefer
<% end -%>