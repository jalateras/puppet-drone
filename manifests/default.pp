exec {"apt-update": 
	command => "apt-get update",
	path => "/usr/bin:/usr/sbin:/bin:/usr/local/bin",
}

Exec["apt-update"] -> Package<| |>

include ntp
include drone

class {'timezone':
	timezone => 'Australia/Melbourne'
}

class {'nginx':
}