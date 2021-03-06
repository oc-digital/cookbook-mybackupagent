name             'mybackupagent'
maintainer       'Jeremy Ward'
maintainer_email 'jeremy@ocdigital.co'
license          'All rights reserved'
description      'Installs/Configures mybackupagent'
long_description 'Installs/Configures mybackupagent'
version          '0.1.0'


supports 'ubuntu'

depends 'apt'
depends 'sshd'
depends 'sudo'
depends 'simple_iptables'
depends 'rbenv'
depends 'memcached'
depends 'nginx'
depends 'nodejs'
depends 'runit'
depends 'postgresql'
depends 'redisio'