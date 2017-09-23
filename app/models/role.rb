class Role < ApplicationRecord
	validates_presence_of :name
	has_many :users
	has_and_belongs_to_many :permissions

	scope :start_with, -> (char) { where(["lower(name) LIKE ?", "#{char}%"]) }
end
