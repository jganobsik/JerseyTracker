class JerseyController < ApplicationController
    get '/jerseys' do
      redirect_if_not_logged_in
        @jerseys = Jersey.all
        erb :'jerseys/index'
      end
      get "/jerseys/new" do
        redirect_if_not_logged_in
        @user = current_user
        erb :'jerseys/new'
      end
      post "/jerseys" do
        redirect_if_not_logged_in
        unless Jersey.valid_params?(params)
          flash[:warning] = "invalid input: title is required"
          redirect "/jerseys"
        end
        current_user.jerseys.create(params)
        redirect "/jerseys"
      end
      get "/jerseys/:id/edit" do
        redirect_if_not_logged_in
        @jersey = Jersey.find(params[:id])
        erb :'jerseys/edit'
      end
        patch '/jerseys/:id' do
          @jersey = Jersey.find(params[:id])
          unless Jersey.valid_params?(params)
            flash[:warning] = "invalid input: title is required"
            redirect "/jerseys"
          end
          @jersey.title = params[:title]
          @jersey.player = params[:player]
          @jersey.player_number = params[:player_number]
          @jersey.sport = params[:sport]
          @jersey.team = params[:team]
          @jersey.picture_url = params[:picture_url]
          @jersey.save
          redirect "/jerseys/#{@jersey.id}"
        end
     get "/jerseys/:id" do
      redirect_if_not_logged_in
       @jersey = Jersey.find(params[:id])
       erb :'jerseys/show'
    end
    delete '/jerseys/:id/delete' do
      @jersey = Jersey.delete(params[:id])
      redirect to("/")
     end
 private
     def is_owner?
      current_jersey = Jersey.find(params[:id])
      current_user.jerseys.include?(current_jersey)
   end
end

