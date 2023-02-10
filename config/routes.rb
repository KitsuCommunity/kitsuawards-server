# frozen_string_literal: true

KitsuAwards::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin'

  get '/graphiql', to: 'graphiql#playground'

  post '/graphql', to: 'graphql#execute'
end
