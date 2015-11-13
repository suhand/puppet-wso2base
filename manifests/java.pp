#
class wso2base::java (
    $java_home         = $wso2base::params::java_home,
    $java_package_name = $wso2base::params::java_package_name,
    $java_target_dir   = $wso2base::params::java_target_dir,
    )  inherits wso2base::params {

    file { "${java_target_dir}/${java_package_name}":
                source => "puppet:///modules/wso2base/java/${java_package_name}",
                recurse => true,
        }
    -> 
    exec { 

        "install_java":
        path      => ["/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"],
        cwd	  => "${java_target_dir}",
        command   => "tar -xzf ${java_target_dir}/${java_package_name}",
        unless    => "test -d ${java_target_dir}/${java_home}",
        creates   => "${java_target_dir}/${java_home}/COPYRIGHT";

        "changing_permissions":
        path      => ["/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"],
        cwd	  => "${java_target_dir}",
        command   => "chown -R root:root ${java_target_dir}/${java_home}; chmod -R 755 ${java_target_dir}/${java_home}",
        require   => Exec["install_java"];
    } 

    file { "${java_target_dir}/java":
        ensure  => link,
        target  => "${java_target_dir}/${java_home}",
        require => Exec["install_java"],
    }

}
 
