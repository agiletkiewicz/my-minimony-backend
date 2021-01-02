# if Rails.env === 'production' 
  Rails.application.config.session_store :cookie_store, key: '_my-minimony', secure: Rails.env.production?
# else
#   Rails.application.config.session_store :cookie_store, key: '_my-minimony' 
# end
