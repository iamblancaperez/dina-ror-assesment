class User < ApplicationRecord
	validates_presence_of :name, :status
	has_one :role
	has_many :permissions
	has_many :role_permissions, :through => :role, :source => :permissions

	def all_permissions
		puts self.role_permissions
		puts (self.permissions + self.role_permissions).uniq.each.size
		(self.permissions + self.role_permissions).uniq.each {|e| puts e.name}
		(self.permissions + self.role_permissions).uniq
	end
end
