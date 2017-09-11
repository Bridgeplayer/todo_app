class Tasklist < ApplicationRecord
	validates :category, presence: true
	validates :description, presence: true
	
	has_many :tasks, :dependent => :delete_all
end