class Api::ValidationCodesController < ApplicationController
  protect_from_forgery with: :null_session


  def create
    p'========================='
    p validate_code_params[:phone]
    p'========================='
    try_send_code_to validate_code_params[:phone]
  end

  def to_logged_consumer
    try_send_code_to current_user.phone
  end

  private
  def validate_code_params
    params.permit(:phone)
  end

  def try_send_code_to phone
    existing_code = ValidationCode.where(phone: phone).last
    if existing_code && existing_code.created_at > Time.now.utc - 1.minute
      render :resent_minute_later, status:208
    else
      code = CodeGenerator.generate_code
      @validation_code_entity = ValidationCode.new({phone: phone, code: code})
      raise unless @validation_code_entity.save
      rend_send_code_result(phone, code)
    end
  end

  def rend_send_code_result(phone, code)
    if NotificationService.send_validation_code(phone, code)
      render :code_sent, status: :created
    else
      render :code_sent_error, status: 422
    end
  end
end
