class UserSessionsWarpController < WarpCable::Controller
    def create(params)
        yield UserSession.create(user: User.find(params[:id]), session: Session.first)
    end 

    def set_ready(params)
        user1 = User.find_by(username:params[:username])
        session = user1.user_sessions.first
        session.ready = true
        session.save
    end

    def set_user(params)
        session[:username] = params[:username]
    end 

    def current_user(params)    
        yield session[:username]
    end 

    def ready(params)
        @user= User.find_by(username:params[:username])
        yield @user.ready
    end 
end 