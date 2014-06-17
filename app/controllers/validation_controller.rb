class ValidationController < ApplicationController
  def mobile
		mobile = params[:mobile]
		data = "false"
		if mobile && mobile.match(/^((\+86)|(86))?(13)\d{9}$/)
			data = "true"
		end
		render :json => data
  end
end
