if Rails.env === 'production' 
    Rails.application.config.session_store :cookie_store, key: '_my-minimony', domain: 'https://www.myminimonyapp.com'
  else
    Rails.application.config.session_store :cookie_store, key: '_my-minimony', domain: 'https://www.myminimonyapp.com'
end

