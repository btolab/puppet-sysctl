define sysctl::define (
  String $variable               = $title,
  String $ensure                 = 'present',
  Optional[String]      $value   = undef,
  Optional[String]      $prefix  = undef,
  String $suffix                 = '.conf',
  Optional[String]      $comment = undef,
  Optional[String]      $content = undef,
  Optional[String]      $source  = undef,
  Boolean $enforce               = true,
  String $sysctl_binary          = '/sbin/sysctl',
  String $sysctl_dir_path        = '/etc/sysctl.d',
) {

  $params = {
    ensure          => $ensure,
    value           => $value,
    prefix          => $prefix,
    suffix          => $suffix,
    comment         => $comment,
    content         => $content,
    source          => $source,
    enforce         => $enforce,
    sysctl_binary   => $sysctl_binary,
    sysctl_dir_path => $sysctl_dir_path,
  }

  $f_params = $params.filter |$key,$value| { $value != undef }

  @sysctl::configuration { $title:
    * => $f_params,
  }

}
