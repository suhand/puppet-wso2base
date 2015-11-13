# WSO2 base class for all WSO2 products puppet modules
class wso2base (
    ) inherits params {

    # Java and Maven version information are taken from hieradata
    # If not found, default values taken from wso2base/params.pp
    $java = hiera("java")
    $maven = hiera("maven")

    class { users: }
    ->
    class { hosts : }
    ->
    class { environment :}
    ->
    class { packages :}
    ->
    class { java :
        java_home          => $java[java_home],
        java_package_name  => $java[java_package_name],
        java_target_dir    => $java[java_target_dir],
    }
    ->
    class { maven :
        maven_home         => $maven[maven_home],
        maven_package_name => $maven[maven_package_name],
        maven_target_dir   => $maven[maven_target_dir],
    }
}
