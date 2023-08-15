# Make file unlimited for holberton users
exec { 'increase_file_hard_limit':
  command => 'sed -i "/holberton hard/s/holberton hard nofile 5/holberton hard nofile 1000/" /etc/security/limits.conf',
  path    => '/usr/bin/:/bin/'
}

exec { 'increase_file_soft_limit':
  command => 'sed -i "/holberton soft/s/holberton soft nofile 4/holberton soft nofile 1000/" /etc/security/limits.conf',
  path    => '/usr/bin/:/bin/'
}
