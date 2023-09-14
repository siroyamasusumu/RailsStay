class ApplicationController < ActionController::Base
before_action :login_user

    def login_user
    @login_user = User.find_by(id: session[:user_id])
    end

end
