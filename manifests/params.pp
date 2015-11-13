#

class wso2base::params {

    # java
    $java_home            = "jdk1.7.0_79"
    $java_package_name    = "jdk-7u79-linux-x64.gz"
    $java_target_dir      = '/opt'

    # maven
    $maven_home           = "apache-maven-3.0.5"
    $maven_package_name   = "apache-maven-3.0.5-bin.tar.gz"
    $maven_target_dir     = '/opt'

    # domains
    $domain               = "wso2.com"
    
    # service codes
    $apimanager_service_code = "am"
    $appmanager_service_code = "appm"
    $applicationserver_service_code = "as"
    $bpserver_service_code = "bps"
    $brserver_service_code = "brs"

    # API Manager subdomains
    $gateway_subdomain    = 'gateway'
    $keymanager_subdomain = 'keymanager'
    $apistore_subdomain   = 'store'
    $publisher_subdomain  = 'pub'
    $management_subdomain = 'mgt'
    
}
