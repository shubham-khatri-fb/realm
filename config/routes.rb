Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope(:path => '/api') do
    post 'push_job', to: 'push_job_in_redis#push_job'
  end

  get 'health_check', to: 'application#health_check'

end
