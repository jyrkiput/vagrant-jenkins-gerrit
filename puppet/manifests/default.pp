## common entry-point into Puppet config.

## if is_vagrant is defined, then we're running under Vagrant.  Use other
## logic/facts to detect environmental stuff.
if $::is_vagrant {
    $data_center = 'vagrant'
} else {
    $data_center = 'amazon'
}

class base_jenkins {
    package { "dejavu-sans-fonts":
        ensure => installed,
    }
    package { "dejavu-serif-fonts":
        ensure => installed,
    }
    package { "fontconfig":
        ensure => installed,
    }
    package { 'git':
      ensure => installed,
    }
}
include role::ui
class { 'java':}
class { 'base_jenkins':}
class { 'jenkins':}
jenkins::plugin {
  "git" :
    version => "1.3.0"
}
