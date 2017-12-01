class NotificationService

  def self.send_validation_code(phone, code)
    SendSMSJob.perform_later(phone, "您的验证码是#{code}。如非本人操作，请忽略本短信").present?
  end
end