# -*- coding: utf-8 -*-
class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.authenticate(params[:nick], params[:passwd])
		if user
			session[:user] = user
		else
			flash[:authentication_error] = {
				:class => "danger",
				:title => "认证错误",
				:msg => "用户名和密码不匹配"
			}
		end
		redirect_to request.referer
	end

	def destroy
		session[:user] = nil
		redirect_to request.referer
	end
end
