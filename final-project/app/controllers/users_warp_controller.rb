class UsersWarpController < WarpCable::Controller 
    def index(params)
        User.after_create do
            yield User.all
        end
        User.after_update do
            yield User.all
        end
        User.after_destroy do
            yield User.all
        end
        yield User.all
    end

    def show(params)
        User.after_update do | user |
            if(params[:id] == user.id)
                yield User.find(params[:id])
            end
        end
        yield User.find(params[:id])
    end
end 