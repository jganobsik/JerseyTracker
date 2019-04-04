class UsersController < ApplicationController


    get '/login' do
        erb :'users/login'
    end
    
    post '/login' do
        user = User.find_by(:email => params[:email])
        if user && user.authenticate(params[:password])
           sessions[:email] = user.email  
           redirect  erb: '/jerseys/index'
        else
            redirect_to '/signup'
        end
    end


end
