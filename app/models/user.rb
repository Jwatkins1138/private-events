class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :events, :foreign_key => "creator_id", :class_name => "Event"
  has_many :guest_lists
  has_many :attended_events, :through => :guest_lists, source: :event
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
