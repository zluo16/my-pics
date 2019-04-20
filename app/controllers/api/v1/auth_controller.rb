class Api::V1::AuthController < ApplicationController
  before_action :authorize_user!, only: [:show]

  def show
    render json: current_user
  end

  def create
    user = find_user(params[:uid])
    if user.present? && user.authenticate(params[:password])
      created_jwt = issue_token({ id: user.id })
      render json: { id: user.id, username: user.username, jwt: created_jwt }
    else
      render json: {
        error: "Couldn't find user with username or email"
      }, status: 422
    end
  end

  private

  def find_user(uid)
    if is_email?()
      User.find_by(email: uid)
    else
      User.find_by(username: uid)
    end
  end

  def is_email?(param)
    param.match(URI::MailTo::EMAIL_REGEXP).present?
  end
end
