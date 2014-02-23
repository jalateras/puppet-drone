class drone::config {
	file {'drone.etc.default':
		ensure => 'file',
		path => '/etc/default/drone',
		owner => 'root',
		group => 'root',
		source => 'puppet:///modules/drone/etc/default/drone',
		require => Class['drone::install'],
		notify => Class['drone::service']
	}

	file {'drone.etc.nginx.site':
		ensure => 'file',
		path => '/etc/nginx/conf.d/drone.mydomain.com.conf',
		owner => 'root',
		group => 'root',
		source => 'puppet:///modules/drone/etc/nginx/conf.d/drone.mydomain.com.conf',
		require => Class['drone::install'],
		notify => Class['nginx::service']
	}
}