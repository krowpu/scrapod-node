server '0.0.0.0',
       user: 'ubuntu',
       roles: :app,
       ssh_options: { keys: %w(keys/example.pem) }
