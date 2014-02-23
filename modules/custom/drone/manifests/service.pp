class drone::service {
	service { "drone":
	    enable => true,
		ensure => running,
		hasrestart => true,
		hasstatus => true
	}
}
