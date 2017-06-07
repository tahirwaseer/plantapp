class Region < ApplicationRecord
	has_many :plants
	validates :name, uniqueness: true
end
