# coding: utf-8

class UsersController < ApplicationController
  permits :name

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show(id)
    @user = User.find(id)
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit(id)
    @user = User.find(id)
  end

  # POST /users
  def create(user)
    @user = User.new(user)

    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render action: 'new'
    end
  end

  # PUT /users/1
  def update(id, user)
    @user = User.find(id)

    if @user.update(user)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /users/1
  def destroy(id)
    @user = User.find(id)
    @user.destroy

    redirect_to users_url
  end
end
