Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
  mount_devise_token_auth_for "User", at: "auth"
  get ':users_id/articles', to:'articles#get'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


# get ':area_id/:prefecture_id/cities', to:'cities#get'

# タスク内容

# API の endpoint （どんな URL アクセスにするか）を設定しよう。
# （ endpoint は /api/v1 から始まることとする ）
# 補足

# /api/v1/articles で CRUD 処理ができるような endpoint が生えるよう、routes.rb を修正していきましょう！


