class JerseyController < ApplicationController

    get '/jerseys' do
        @jerseys = Jersey.all
        erb :'jerseys/index'
      end
    
      get "/jerseys/new" do
        erb :jerseys/new'
      end
end
