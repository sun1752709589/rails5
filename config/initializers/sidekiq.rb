Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://172.28.128.5:6379/12' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://172.28.128.5:6379/12' }
end