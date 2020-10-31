class UserController < ApplicationController
    def index
        users = User.all
        render json: users
    end

    def show
        user = User.find_by_id(params[:id])
        render json: user
    end

    def create
        user = User.new(user_params)
        if user.save
            render json: { status: :created, user: user }
        else
            render json: { messages: user.errors.full_messages, sucess: false }
        end
    end

    def update
        user = User.find_by_id(params[:id])
        if user.update(user_params)
            render json: user
        else
            render json: { messages: user.errors.full_messages}
        end
    end

    def delete
        user = User.find_by_id(params[:id])
        user.delete
        render json: { message: "User destroyed" }
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :first_name, :last_name, :username)
    end
end
