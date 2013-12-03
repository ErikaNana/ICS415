class UsersController < ActionController::Base
    def oauth_failure
        redirect_to root_path
    end
end