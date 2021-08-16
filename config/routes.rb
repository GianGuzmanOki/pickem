Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope module: :v1, path: 'api/v1' do
    resource :users, only: [:create]
    resource :picks, only: [:create]
    get "/matches", to: "matches#index"
    post "/login", to: "auth#login"
    get "/auto_login", to: "auth#auto_login"
    get "/user_is_authed", to: "auth#user_is_authed"
  end

  scope module: :admin do
    scope module: :v1, path: 'admin/api/v1' do
      post "/match_questions/:match_question_id/mark_winner", to: "match_questions#mark_winner"
      post "/login", to: "auth#login"
      get "/auto_login", to: "auth#auto_login"
      get "/user_is_authed", to: "auth#user_is_authed"
    end
  end
end
