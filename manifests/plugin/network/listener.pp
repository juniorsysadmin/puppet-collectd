#
define collectd::plugin::network::listener (
  Enum['present', 'absent'] $ensure                         = 'present',
  Optional[Stdlib::Absolutepath] $authfile                  = undef,
  Optional[String] $port                                    = undef,
  Optional[Collectd::Network::Securitylevel] $securitylevel = undef,
  Optional[String] $interface                               = undef,
) {

  include ::collectd
  include ::collectd::plugin::network

  $conf_dir = $collectd::plugin_conf_dir

  file { "${conf_dir}/network-listener-${name}.conf":
    ensure  => $ensure,
    mode    => '0640',
    owner   => 'root',
    group   => $collectd::root_group,
    content => template('collectd/plugin/network/listener.conf.erb'),
    notify  => Service['collectd'],
  }
}
