require 'api_constraints'

Rails.application.routes.draw do
  mount SabisuRails::Engine => "/sabisu_rails"
  devise_for :users
  #API Definition
  namespace :api, defaults: { format: :json },
                            constraints: { subdomain: 'api' }, path: '/' do
    scope module: :v1,
               constraints: ApiConstraints.new(version: 1, default: true) do

      # We are going to list our resources here
      resources :users, :only => [:show, :create, :update, :destroy]
      resources :sessions, :only => [:create, :destroy]
      resources :words, :only => [:show, :index]
      resources :lists, :only => [:show, :index, :create] do
        resources :words, :only => [:create]
      end
    end

  end
end
