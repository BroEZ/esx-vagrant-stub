exec { 'run_something':
	command => '/usr/bin/echo "$(date)" >> /tmp/PUPPET_WORKED',
}
