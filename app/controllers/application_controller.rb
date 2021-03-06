class ApplicationController < Sinatra::Base
    configure do
        require 'sinatra/flash'
        register Sinatra::Flash
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "HockeyJerseys"
    end
    get '/' do
        if logged_in?
            redirect '/jerseys'
        else
            erb :index
        end
    end
    helpers do  
        def logged_in?
            !!session[:user_id]
        end
        def redirect_if_not_logged_in
            if !logged_in?
                redirect "/login"
            end
        end
        def current_user
            User.find(session[:user_id])
          end
    end
end