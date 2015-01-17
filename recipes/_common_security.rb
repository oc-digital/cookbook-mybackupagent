#
# Cookbook Name:: mybackupagent
# Recipe:: _commont_security
#

# Secure the system
#   configure SSH
#   configure iptables

include_recipe "simple_iptables"

# Reject packets other than those explicitly allowed
simple_iptables_policy "INPUT" do
  policy "DROP"
end

# Allow all traffic on the loopback device
simple_iptables_rule "system" do
  rule "--in-interface lo"
  jump "ACCEPT"
end

# Allow any established connections to continue, even
# if they would be in violation of other rules.
simple_iptables_rule "system" do
  rule "-m conntrack --ctstate ESTABLISHED,RELATED"
  jump "ACCEPT"
end

# Allow SSH
simple_iptables_rule "ssh" do
  rule "--proto tcp --dport #{node['mybackupagent']['sshd_config']['Port']}"
  jump "ACCEPT"
end

# Allow HTTP, HTTPS
simple_iptables_rule "http" do
  rule [ "--proto tcp --dport 80",
         "--proto tcp --dport 443" ]
  jump "ACCEPT"
end

# Log
simple_iptables_rule "system" do
  rule "--match limit --limit 5/min --jump LOG --log-prefix \"iptables denied: \" --log-level 7"
  jump false
end

include_recipe "sshd"

file "/etc/ssh/sshd_config" do
  action :delete
end

openssh_server '/etc/ssh/sshd_config' do
  AllowUsers "#{node['mybackupagent']['user']} postgres"
  AllowAgentForwarding "#{node['mybackupagent']['sshd_config']['AllowAgentForwarding']}"
  AuthorizedKeysFile '%h/.ssh/authorized_keys'
  LoginGraceTime '120'
  LogLevel 'INFO'
  PasswordAuthentication "#{node['mybackupagent']['sshd_config']['PasswordAuthentication']}" # probably want to change to NO
  PermitEmptyPasswords 'no'
  PermitRootLogin "#{node['mybackupagent']['sshd_config']['PermitRootLogin']}" # set to NO
  Port node['mybackupagent']['sshd_config']['Port']
  PubkeyAuthentication 'yes'
  PrintLastLog 'yes'
  RSAAuthentication 'yes'
  StrictModes 'yes'
  TCPKeepAlive 'yes'
  UseDNS 'no'
  UsePAM 'no'
  X11DisplayOffset '10'
end
