class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    @users = User.all
  end

  def show
    @followed_users = @user.followed_users.where.not(id: @user)
    @followers = @user.followers.where.not(id: @user)
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end
