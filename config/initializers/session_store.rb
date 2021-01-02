# if Rails.env === 'production' 
  # Rails.application.config.session_store :cookie_store, key: '_my-minimony', secure: Rails.env.production?
# else
#   Rails.application.config.session_store :cookie_store, key: '_my-minimony' 
# end


# if Rails.env == 'production' 
#   Rails.application.config.session_store :cookie_store, key: '_my-minimony', domain: 'myminimonyapp.com'
# else
#   Rails.application.config.session_store :cookie_store, key: '_my-minimony' 
# end

Rails.application.config.session_store :cookie_store, {
  :key => '_my-minimony',
  :domain => :all,
  :same_site => :none,
  :secure => :true,
  :tld_length => 2
}