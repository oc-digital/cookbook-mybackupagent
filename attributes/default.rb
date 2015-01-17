default['mybackupagent']['user']             = 'ocd'
default['mybackupagent']['db_root_password'] = 'MyRandomdBpassword'
default['mybackupagent']['home_dir']         = "/home/#{default['mybackupagent']['user']}"
default['mybackupagent']['group']            = 'sudo'
default['mybackupagent']['password']         = "$1$3XJlGhET$Zz2s1s0yURmac7p1u1Peh."
default['mybackupagent']['no_password_cmds'] = [
  "/etc/init.d/nginx",
  "/etc/init.d/unicorn_#{node["mybackupagent"]["app_name"]}"
]
default['mybackupagent']['ssh_keys'] = [
  "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDL4enOfTs8LI0KjeGIDQwv0Urstk5sjMjdv8w8jAnWeI4DQ4+RXPjC77F/SrSuLUwUbgO2jAGl6VhgmQ6urnbI7mgZebSMMCobo6qpsvkYW4yAoXoJl1vWZgLbusfl9UqZtRYTFxu3y8z1pZQY69yjRT8AI57AS3XeGG4BpstEpmwPhhhPPQoiBMF6k6rCTh0sivHC0/60uJa6TuKUGXgt4Df97PqXe/Q4ROd8Oo7SZDprqajs43TjrKzKA6ALuurwX7FVi5ZQO4GPRIYi/m5QX7xgvvB5w4YLnOUKr6lFsHOSbjg1ztNqPxSxonJhq0ppqHT3dFNngfN274dztC+t jrmy.ward@gmail.com"
]
default['mybackupagent']['app_name']         = 'mybackupagent'
default['mybackupagent']['app_path']         = "#{node['mybackupagent']['home_dir']}/app"
default['mybackupagent']['environment']      = 'production'
default['mybackupagent']['db_name']          = "#{node["mybackupagent"]["app_name"]}_#{node["mybackupagent"]["environment"]}"
default['mybackupagent']['db_password']      = 'Revi3wMypAssw0rdnoW'
default['mybackupagent']['unicorn_workers']  = 3

node.set['authorization']['sudo']['groups']               = ["sudo"]
node.set['authorization']['sudo']['include_sudoers_d']    = "true"
node.default['authorization']['sudo']['sudoers_defaults'] = [
  'env_reset',
  'secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"'
]

# node.set['postgresql']['apt_distribution']            = 'precise'
# node.set['postgresql']['version']                     = "9.3"
node.default['mybackupagent']['ruby']['versions']       = %w(2.1.2)
node.default['mybackupagent']['ruby']['global_version'] = "2.1.2"

node.default['mybackupagent']['sshd_config'] = {
  'AcceptEnv' => 'LANG LC_*',
  'AllowAgentForwarding' => 'yes',
  'AllowUsers' => "#{node['mybackupagent']['user']} postgres",
  'AuthorizedKeysFile' => '%h/.ssh/authorized_keys',
  'ChallengeResponseAuthentication' => 'no',
  'LoginGraceTime' => '120',
  'LogLevel' => 'INFO',
  'HostbasedAuthentication' => 'no',
  'HostKey' => [ '/etc/ssh/ssh_host_dsa_key',
                 '/etc/ssh/ssh_host_ecdsa_key',
                 '/etc/ssh/ssh_host_rsa_key'
  ],
  'IgnoreRhosts' => 'yes',
  'KeyRegenerationInterval' => '3600',
  'PasswordAuthentication' => 'no', # CHANGE to NO
  'PermitEmptyPasswords' => 'no',
  'PermitRootLogin' => 'no', # CHANGE to NO
  'PrintMotd' => 'no',
  'Port' => 30007, # set to something other than 22
  'Protocol' => 2,
  'PubkeyAuthentication' => 'yes',
  'PrintLastLog' => 'yes',
  'RhostsRSAAuthentication' => 'no',
  'RSAAuthentication' => 'yes',
  'ServerKeyBits' => '768',
  'StrictModes' => 'yes',
  'Subsystem' => 'sftp /usr/lib/openssh/sftp-server',
  'SyslogFacility' => 'AUTH',
  'TCPKeepAlive' => 'yes',
  'UseDNS' => 'no',
  'UsePAM' => 'no',
  'UsePrivilegeSeparation' => 'yes',
  'X11DisplayOffset' => '10',
  'X11Forwarding' => 'yes'
}
