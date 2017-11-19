Rails.application.routes.draw do
  get 'inquiry/new', to: 'inquiry#new'
  # get 'entry/new', to: 'entry#new', as: 'entry'
  post 'inquiry/confirm', to: 'inquiry#confirm'
  post 'inquiry/finish', to: 'inquiry#finish'

end
