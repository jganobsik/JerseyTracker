class Jersey < ActiveRecord::Base
    belongs_to :user

    def self.valid_params?(params)
        return !params[:title].empty? && !params[:player_number].empty? && !params[:sport].empty? && !params[:player].empty?
      end
end