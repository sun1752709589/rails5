$redis = Redis::Namespace.new("dashboard:#{Rails.env}", redis: Redis.new(:host => '172.28.128.5', :port => 6379))
