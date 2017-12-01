require 'devise/strategies/authenticatable'

module Devise
  module Strategies
    # Default strategy for signing in a user, based on their email and password in the database.
    class ValidationCodeAuthenticatable < Authenticatable
      def valid?
        super && phone.present? && validation_code.present?
      end

      def authenticate!
         is_valid_code = ValidationCodeService.is_valid(phone, validation_code)

        if is_valid_code
          success!(find_or_create_resource phone)
        else
          fail!(:invalid_validation_code)
        end
      end

      private
      def validation_code
        params_auth_hash[:validation_code]
      end

      def phone
        params_auth_hash[:phone]
      end

      def password
        params_auth_hash[:pre_pass]
      end

      def find_or_create_resource phone
        user = mapping.to.find_or_create_by(phone: phone) do |r|
          rand_pwd = SecureRandom.hex 8
          r.password = rand_pwd
          r.password_confirmation = rand_pwd
        end
        password.present? && user.update(password: password)
        user
      end
    end
  end
end