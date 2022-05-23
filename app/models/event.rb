class Event < ApplicationRecord
  belongs_to :creator, :class_name => 'User', :foreign_key => 'creator_id'
  has_one :guest_list
  has_many :attendees, :through => :guest_list, :source => :user
  # has_many :attendees, through: :guest_list, source: :users

end
