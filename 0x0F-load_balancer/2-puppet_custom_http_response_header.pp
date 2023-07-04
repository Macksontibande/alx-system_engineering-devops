# A script to automate the task of creating a custom
# HTTP header response, but with Puppet.

exec { 'Update apt library':
  command => 'sudo apt update',
  path    => '/usr/bin/'
}

package { 'nginx':
  ensure  => installed,
  require => Exec['Update apt library'],
}

# Add custom header to nginx
file_line { 'Custom header':
  ensure  => 'present',
  path    => '/etc/nginx/sites-enabled/default',
  after   => 'listen \[::\]:80 default_server;',
  line    => "\tadd_header X-Served-By ${hostname};",
  require => Package['nginx'],
}

# Restart nginx service
service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}
