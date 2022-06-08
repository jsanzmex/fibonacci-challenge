Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://gupositiones.rubyonrails.org/routing.html

  scope :api do
    get "fibonacci/:position", to: "fibonacci#show", as: :some_fibonacci, constraints: { position: /[0-9]+/ }
    get "fibonacci", to: "fibonacci#index"
  end

end
