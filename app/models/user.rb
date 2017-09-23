class User < ApplicationRecord
	validates_presence_of :name, :status
	belongs_to :role, optional: true
	has_and_belongs_to_many :permissions
	has_many :role_permissions, :through => :role, :source => :permissions

	def all_permissions
		(self.permissions + self.role_permissions).uniq
	end
end
