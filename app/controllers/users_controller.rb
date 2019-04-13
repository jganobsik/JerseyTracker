class UsersController < ApplicationController

    get '/users/:id' do
        if !logged_in?
          redirect '/jerseys'
        end
      end
    
    
    get '/users/:id' do
        if !logged_in?
          redirect '/jerseys'
        end
    
        @user = User.find(params[:id])
        if !@user.nil? && @user == current_user
          erb :'users/show'
        else
          redirect '/jerseys'
        end
      end
    

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

    get '/signup' do
      if !session[:user_id]
        erb :'users/new'
      else
        redirect to '/jerseys'
      end
    end
  
    post '/signup' do 
      if params[:email] == "" || params[:password] == ""
        redirect to '/signup'
      else
        @user = User.create(:email => params[:email], :password => params[:password])
        session[:user_id] = @user.id
        redirect '/jerseys'
      end
    end
  
end
