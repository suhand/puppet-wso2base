#
class wso2base::maven (
    $maven_home         = $wso2base::params::maven_home,
    $maven_package_name = $wso2base::params::maven_package_name,
    $maven_target_dir   = $wso2base::params::maven_target_dir,
    ) inherits wso2base::params {

    file { "${maven_target_dir}/${maven_package_name}":
                source => "puppet:///modules/wso2base/maven/${maven_package_name}",
                recurse => true,
        }
    ->    
    exec { 
        "extract_mvn":
            path    => ["/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"],
            unless  => "test -d ${maven_target_dir}/${maven_home}",
            cwd => "${maven_target_dir}/",
            command => "tar xvfz ${maven_package_name}",
    }
    ->
    file { "${maven_target_dir}/mvn":
        ensure  => link,
        target  => "${maven_target_dir}/${maven_home}",
    }    
}
