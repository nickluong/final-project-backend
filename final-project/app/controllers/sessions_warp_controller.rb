class SessionsWarpController < WarpCable::Controller
    def index(params)
        Session.after_create do
            yield Session.all
        end
        Session.after_update do
            yield Session.all
        end
        Session.after_destroy do
            yield Session.all
        end
        yield Session.all
    end

    def play(params)
        yield true
    end 
    
    def check(params)
        UserSession.after_commit do 
            yield Session.first.user_sessions.all?{|user_session| user_session.ready}
        end
        yield Session.first.user_sessions.all?{|user_session| user_session.ready}
    end 

end 