class Api::UsersController < ApplicationController

  def index
    @users = User.all
    render 'index.json.jb'
  end

  def show
    @user = user.find(params[:id])
    render 'show.json.jb'
  end
end
