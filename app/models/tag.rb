# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tag_image  :string(255)
#  bulletin   :string(255)
#

class Tag < ApplicationRecord
  has_and_belongs_to_many :articles
end
