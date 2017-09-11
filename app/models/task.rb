class Task < ApplicationRecord
	validates :action, presence: true
	validates :due_date, presence: true

	belongs_to :tasklist
end