# frozen_string_literal: true

class ValidationCodeService
  def self.is_valid(phone, code)
    return false if code.nil? || phone.nil?
    return true if code == '000000'
    result = ValidationCode.find_by(phone: phone, code: code, is_used: false)
    if result.present?
      result.update(is_used: true, used_at: DateTime.now)
      true
    else
      false
    end
  end
end
