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

require 'test_helper'

class ValidationCodeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
