class SessionsController < ApplicationController

get '/login' do
    erb :'sessions/login.html'
end

post '/sessions' do
redirect  erb: '/jerseys/index'
end
end