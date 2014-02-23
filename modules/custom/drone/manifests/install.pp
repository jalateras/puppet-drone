class drone::install {
	exec { "drone.download":
		cwd => "/var/tmp",
		creates => "/var/tmp/drone.deb",
		command => "wget http://downloads.drone.io/latest/drone.deb",
		path => "/usr/local/bin:/bin:/usr/bin"
	}

	exec { "drone.install":
		require => Exec["drone.download"],
		cwd => "/var/tmp",
		onlyif => "test ! -d drone.deb",
		command => "sudo dpkg -i drone.deb",
		path => "/usr/local/bin:/bin:/usr/bin",
		creates => "/usr/local/bin/done"
	}

	group { 'drone':
		ensure => present
	}

	user { 'drone':
		ensure => present,
		gid => 'drone',
		require => Group['drone']
	}
}