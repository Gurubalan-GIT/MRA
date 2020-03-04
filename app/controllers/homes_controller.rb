class HomesController < ApplicationController
    before_action do 
        redirect_to new_user_session_path unless !current_user
      end

    def index 
    end
end
