# module Api::V1
class Api::V1::BaseApiController < ApplicationController
  # before_action :authenticate_api_v1_user!,except:[:create,:update,:destroy]

  def current_user
    @current_user ||= User.first
  end

  # def current_user
  #   @current_user ||= warden.authenticate(scope: :user)
  # end

  # def user_signed_in?

  # end
end
# end
