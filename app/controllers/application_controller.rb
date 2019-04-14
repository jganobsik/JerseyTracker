class ApplicationController < Sinatra::Base

    configure do
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

    end
end