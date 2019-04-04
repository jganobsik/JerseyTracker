class UsersController < ApplicationController
    get '/login' do
        erb :'users/login'
    end
    
    post '/sessions' do
    redirect  erb: '/jerseys/index'
    end


end
