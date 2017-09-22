class User < ApplicationRecord
	validates_presence_of :name, :status
	has_many :permissions
end
