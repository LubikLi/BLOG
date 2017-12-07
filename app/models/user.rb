# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  phone                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  name                   :string(255)
#
# Indexes
#
#  index_users_on_phone                 (phone) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         authentication_keys: [:phone]

  # has_many :articles, dependent: :destroy

  def validation_code
  end

  def display_name
    name.present? ? name : "用户#{mask_number(phone)}"
  end

  def mask_number(number, head_number_count = 3, tail_number_count = 4)
    return '' if number.nil?

    matched = number.match(/^(\d{#{head_number_count}})(.*)(\d{#{tail_number_count}})$/)
    return '*' * number.to_s.size if matched.nil?

    matched[1] + '*' * matched[2].size + matched[3]
  end
end
