# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Group < ActiveRecord::Base
  ADMIN_GROUP_NAME = 'Admins'

  has_and_belongs_to_many :users

  #attr_accessible :name

  validates :name, :presence => true
  validates :name, :length => { maximum: 255 }
end
