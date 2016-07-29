# puppetconf manages a puppet.conf file through a simple template
# paremeters starting with all_ are always present if defined
# ismaster - says this is a puppetmaster and include some other config
#
class puppetconf (
  $filepath = '/etc/puppet/puppet.conf',
  $all_logdir = '/var/log/puppet',
  $all_vardir = '/var/lib/puppet',
  $all_rundir = '/var/run/puppet',
  $all_ssldir = '$confdir/ssl',
  $all_factpath = '$confdir/facter',
  $all_environment = undef,
  $ismaster = false,
  $master_dns_alt_names = undef,
  $master_autosign = '$confdir/autosign.conf'
) {
  file { 'puppet_conf':
    ensure  => 'file',
    path    => $filepath,
    content => template("${module_name}/puppet_conf.erb")
  }
}