class JerseyController < ApplicationController

    get '/jerseys' do
        @jerseys = Jersey.all
        erb :'jerseys/index'
      end
    
      get "/jerseys/new" do
        @user = current_user
        erb :'jerseys/new'
      end

      post "/jerseys" do
        unless Jersey.valid_params?(params)
          redirect "/jerseys"
        end
        current_user.jerseys.create(params)
        redirect "/jerseys"
      end

      get "/jerseys/:id/edit" do
        @jersey = Jersey.find(params[:id])
        erb :'jerseys/edit'
      end

      post "/jerseys/:id" do
        
        @jersey = Jersey.find(params[:id])
        unless Jersey.valid_params?(params)
          redirect "/jerseys"
        end
        @jersey.update(params.select{|j|j=="title" || j=="player" || j=="number" || j=="sport"})
        redirect "/jerseys/#{@jersey.id}"
      end


     get "/jerseys/:id" do
 
       @jersey = Jersey.find(params[:id])
       erb :'jerseys/show'
    end


    delete '/jerseys/:id' do
      @jersey = Jersey.delete(params[:id])
      redirect to("/")
     end

 private
     def is_owner?
      current_jersey = Jersey.find(params[:id])
      current_user.jerseys.include?(current_jersey)
   end
end
