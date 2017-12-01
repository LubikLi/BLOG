class SMSService
  include HTTParty
  base_uri 'http://106.ihuyi.com/'

  def self.send_sms(phone, text)
    Rails.logger.info("Sending #{text} to #{phone}")
    res = post('/webservice/sms.php?method=Submit', body: {account: 'cf_qxwl', password: '123456', mobile: phone, content: text})
    Rails.logger.info(res)
  end
end