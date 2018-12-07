class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:login, :create]

    def login
    @user = User.find_by(username: user_params[:username])
        if @user && @user.authenticate(user_params[:password])
            @token = encode_token(user_id: @user.id)
                render json: { 
                    user: @user,
                    token: @token
                }, status: :accepted
            else
                render json: { error: 'Invalid username or password' }, status: :unauthorized
            end
    end 

    def index   
        render json: {'users': User.all}
    end 

    def create 
        @user = User.create(user_params)
        @token = encode_token(user_id: @user.id)
        render json: {user: @user, token: @token}
    end 

    def friends
        render json:{'friends': User.find(params[:id]).friends}
    end 

    private 

    def user_params 
        params.require(:user).permit(:username, :password)
    end 

end
