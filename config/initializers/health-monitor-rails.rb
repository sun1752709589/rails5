HealthMonitor.configure do |config|
  config.redis
  config.sidekiq
  config.add_custom_provider(CustomProvider)
  config.error_callback = proc do |e|
    msg = "Health check failed with: #{e.message}; at: #{Time.now}..."
    Airbrake.notify(msg) if defined?(Airbrake)
  end
  config.basic_auth_credentials = {
    username: 'admin',
    password: '...'
  }
end