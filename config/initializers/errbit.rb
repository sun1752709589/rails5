Airbrake.configure do |config|
  config.environment = :development
  config.ignore_environments = [:test, :production]
  config.host = 'http://errbit.huantengsmart.com.cn'
  config.project_id = 666
  config.project_key = '...'
end