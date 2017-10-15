Rails.application.routes.draw do
  get 'entry/new', to: 'entry#new', as: 'entry'
  post 'entry/confirm', to: 'entry#confirm'
  post 'entry/finish', to: 'entry#finish'

end
