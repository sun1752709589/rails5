Rails.application.routes.draw do
  resources :home
  mount HealthMonitor::Engine, at: '/monit'
end
