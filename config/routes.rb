Rails.application.routes.draw do
root 'converter#index'
post '/', to: 'converter#upload'
end
