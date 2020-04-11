server '54.169.157.1', user: 'ubuntu', roles: %w[web app db]
set :ssh_options, forward_agent: true
set :stage, :production
set :deploy_to, '/var/deploy/sport_scoop'
set :passenger_restart_command, "touch #{release_path}/tmp/restart.txt"
set :passenger_restart_options, -> {}
set :branch, 'master'
set :linked_dirs, %w(tmp/pids)

set :ssh_options, { forward_agent: true,
  auth_methods: %w(publickey),
  keys: "#{ENV['HOME']}/Documents/jk92official.pem" }
