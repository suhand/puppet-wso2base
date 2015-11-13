#
class wso2base::users {
    # This is taken from common.yaml file
    $users = hiera("nodeinfo")

    user { $users[owner]:
        ensure  => present,
        shell      => '/bin/bash',
        managehome => true,
    }
}
