Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
    }
   
  resources :events
  # resources :guest_lists
  # POST 'guest_lists/create.:event_id', to: 'guest_lists#create'
  post 'events/add_attendee/:id', to: 'events#add_attendee', as: 'add_attendee'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "events#index"
end
