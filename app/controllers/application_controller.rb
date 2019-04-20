class ApplicationController < ActionController::Base
  private

  def issue_token(payload)
    JWT.encode(payload, secret, 'HS256')
  end

  def authorize_user!
    if !current_user.present?
      render json: { error: 'User not logged in.' }
    end
  end

  def token
    request.headers['Authorization']
  end

  def decoded_token
    if token
      begin
        JWT.decode(token, secret, true, { algorithm: 'HS256' })
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def token_user_id
    decoded_token.first['id']
  end

  def current_user
    if decoded_token
      @user = User.find_by(id: token_user_id)
    end
  end

  def secret
    ENV['secret']
  end
end
