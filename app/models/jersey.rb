class Jersey < ActiveRecord::Base
    belongs_to :user
    def self.valid_params?(params)
        return !params[:title].empty?
      end
end