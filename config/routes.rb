Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#homepage'

  get '/parallel' => 'parallel#parallelrate'
  get '/bdcrate' => 'bdc#bdcrate'

  get 'fairprice/list'
  get 'honestbee/list'
end
