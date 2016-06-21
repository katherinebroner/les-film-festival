Rails.application.routes.draw do

  # sessions routes
  get   'login',  to: "sessions#new"
  post  'login',  to: "sessions#create"
  get   'logout', to: "sessions#destroy"

  # category [index, show]
  resources :categories, only: [:index, :show]



  # movie
  # should movie index page be "top movies for category"?

  # movies and reviews and comments
  # index page lists 10 most recent reviews overall, AND 5 most recent per category
  resources :movies, only: [:index, :show] do
    resources :reviews, only: [:new, :edit, :create, :update] do
      resources :comments, only: [:new, :edit, :create, :update]
    end
  end

  #review index route
  get 'reviews', to: 'reviews#index'

  # review custom destroy route
  get 'movies/:movie_id/reviews/:id/delete', to: 'reviews#destroy', as: "review_delete"

  # comment custom destroy route
  get'movies/:movie_id/reviews/:review_id/comments/:id/delete', to: "comments#destroy", as: "comment_delete"

  # user
  resources :users, only: [:new, :create, :show]

  # judge
  get   'judges',           to: "users#index"
  get   'judges/register',  to: "users#new_judge"
  post  'judges/register',  to: "users#create_judge"
  get   'judges/login',     to: "sessions#new"
  get   'judges/:id',       to: "users#show",       as: "judge"

  # welcome/root
  root "application#index"

  # static pages: tickets, venue, winners - stretch
  get 'tickets',     to: "application#tickets",    as: "tickets"
  get 'venues',      to: "application#venues",     as: "venues"
  get 'winners',     to: "application#winners",    as: "winners"
  get 'contact',     to: "application#contact",    as: "contact"
end
