class Api::V1::BaseApiController < ApplicationController
  def current_user
    @current_user ||= User.first
  end

  # alias_method :current_user
  # alias_method :authenticate_user!
  # alias_method :user_signed_in?

  # alias_method :current_user, :current_api_v1_user
  # alias_method :authenticate_user!,:authenticate_api_v1_user!
  # alias_method :user_signed_in?,:api_v1_user_signed_in?
end

# alias_method
# alias_method
# alias_method

# :current_user, :current_api_v1_user
#    :authenticate_user!,:authenticate_api_v1_user!
#    :user_signed_in?,:api_v1_user_signed_in?
