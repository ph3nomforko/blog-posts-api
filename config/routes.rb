Rails.application.routes.draw do
  
  namespace :api do
    get '/posts', to: "posts#get_posts"

    get '/ping', to: "posts#ping"
    resources :posts
  end

end
