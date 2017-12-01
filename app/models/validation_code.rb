# == Schema Information
#
# Table name: validation_codes
#
#  id         :integer          not null, primary key
#  phone      :string(255)
#  code       :string(255)
#  is_used    :boolean          default(FALSE)
#  used_at    :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ValidationCode < ApplicationRecord
end
