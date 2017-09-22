class Permission < ApplicationRecord
	validates_presence_of :name
	belongs_to :role
	belongs_to :user
end
