# -*- coding: utf-8 -*-
class ValidationController < ApplicationController

	def uniq_user_nick
		data = uniq_user_attr(:nick, params[:user][:nick]) ? "true" : "false"
		render :json => data
	end

	def uniq_user_email
		data = uniq_user_attr(:email, params[:user][:email]) ? "true" : "false"
		render :json => data
	end

	def valid_user_mobile
		mobile = params[:user][:mobile]
		data = (mobile && mobile.match(/^((\+86)|(86))?(13)\d{9}$/) && uniq_user_attr(:mobile, mobile)) ? "true" : "false"
		render :json => data
	end

	def uniq_user_attr(key, value)
		User.where(key => value).length == 0 ? true : false
	end
	
end
