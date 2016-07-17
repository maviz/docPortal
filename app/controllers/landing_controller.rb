class LandingController < ApplicationController

	#rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
	#before_action :authenticate_user!
	def index
		@a = current_user.nil?  ? 'Guest' : "#{current_user.email} ( #{current_user.roles[0].name unless current_user.roles.blank?} )"
	end



	def doctors 
	end

	def hospitals 
	end 

	def users
	end

  # private

  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(request.referrer || root_path)
  # end

end
