# -*- coding: utf-8 -*-
class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.authenticate(params[:nick], params[:passwd])
		if user
			session[:user] = user
			redirect_to posts_path
		else
			flash[:authentication_error] = {
				:class => "danger",
				:title => "认证错误",
				:msg => "用户名和密码不匹配"
			}
			redirect_to users_path
		end
	end

	def destroy
		session[:user] = nil
		redirect_to posts_path
	end
end
