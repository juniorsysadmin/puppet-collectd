#
define collectd::plugin::network::server (
  Enum['present', 'absent'] $ensure                         = 'present',
  Optional[String] $username                                = undef,
  Optional[String] $password                                = undef,
  Optional[String] $port                                    = undef,
  Optional[Collectd::Network::Securitylevel] $securitylevel = undef,
  Optional[String] $interface                               = undef,
  Optional[Boolean] $forward                                = undef,
  Optional[Integer[0]] $resolveinterval                     = undef,
) {

  include ::collectd
  include ::collectd::plugin::network

  $conf_dir = $::collectd::plugin_conf_dir

  file { "${conf_dir}/network-server-${name}.conf":
    ensure  => $ensure,
    mode    => '0640',
    owner   => 'root',
    group   => $::collectd::root_group,
    content => template('collectd/plugin/network/server.conf.erb'),
    notify  => Service['collectd'],
  }
}
