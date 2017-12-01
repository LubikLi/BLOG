class SendSMSJob < ActiveJob::Base
  queue_as :default

  def perform(phone, text)
    SMSService.send_sms(phone, text)
  end
end