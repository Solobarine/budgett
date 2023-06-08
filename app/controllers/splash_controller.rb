class SplashController < ApplicationController
    def index
        if current_user
            redirect_to group_index_path
        end
    end
end
