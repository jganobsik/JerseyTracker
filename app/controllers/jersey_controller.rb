class JerseyController < ApplicationController

    get '/jerseys' do
        @jerseys = Jersey.all
        erb :'jerseys/index'
      end
    
      get "/jerseys/new" do
        erb :'jerseys/new'
      end

      post "/jerseys" do
    
        Jersey.create(params)
        redirect "/jerseys"
      end

      get "/jerseys/:id/edit" do
        @jersey = Jersey.find(params[:id])
        erb :'jerseys/edit'
      end

      post "/jerseys/:id" do
        
        @jersey = Jersey.find(params[:id])
        @jersey.update(params.select{|j|j=="title" || j=="player" || j=="number" || j=="sport"})
        redirect "/jerseys/#{@jersey.id}"
      end


  get "/jerseys/:id" do
 
    @jersey = Jersey.find(params[:id])
    erb :'jerseys/show'
  end
end
