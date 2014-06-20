# -*- coding: utf-8 -*-
require 'securerandom'

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

	def activation
		users = User.where(activation_key: params[:user][:activation_key])
		if users.length > 1
			render json: "multiple user with same activation key", status: :unprocessable_entity
		elsif users.length == 1
			user = users.first
			puts "#{user.inspect}"
			user.activation_key = ""
			user.activated = true
			if user.save
				redirect_to user, notice: '您已成功激活你的帐号'
			else
				render json: user.errors, status: :unprocessable_entity
			end
		else
			render json: "invalid activation key", status: :unprocessable_entity
		end
	end
	
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
		@user.activated = false
		@user.activation_key = SecureRandom.uuid

    respond_to do |format|
      if @user.save

				UserMailer.activation_email(@user).deliver
				
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:nick, :name, :passwd, :avatar, :email, :mobile)
    end
end
