# == Schema Information
#
# Table name: pictures
#
#  id             :integer          not null, primary key
#  height         :string(255)
#  width          :string(255)
#  url            :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  imageable_id   :integer
#  imageable_type :string(255)
#  name           :string(255)
#

require 'test_helper'

class PictureTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
