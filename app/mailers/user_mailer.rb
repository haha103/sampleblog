# -*- coding: utf-8 -*-
class UserMailer < ActionMailer::Base
  default from: "wliu272@163.com"

	def activation_email(user)
		@user = user
		mail(to: @user.email, subject: "欢迎来到Sampleblog")
	end
	
end
