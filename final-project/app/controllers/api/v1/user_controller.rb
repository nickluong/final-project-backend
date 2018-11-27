class Api::V1::UserController < ApplicationController

    def index   
        render json: {'users': User.all}
    end 

    def test 
        render json:{'message': 'random shit'}
    end 

    def friends
        render json:{'friends': User.find(params[:id]).friends}
    end 
end
