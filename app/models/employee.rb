class Employee < ApplicationRecord
	validates :name, exclusion: { in: [nil, ""]}
	validates :department, exclusion: { in: [nil]}
	validates :payment, numericality: true, exclusion: { in: [nil]}
	validates :address, exclusion: { in: [nil]}
end
