class CustomProvider < HealthMonitor::Providers::Base
  def check!
    raise 'error...'
  end
end