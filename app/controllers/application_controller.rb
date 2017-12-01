class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # def current_user
  #   User.find_or_create_by(id: 1) do |user|
  #     user.password = '123456'
  #     user.password_confirmation = '123456'
  #   end
  # end
end
