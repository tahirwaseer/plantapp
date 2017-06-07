class Plant < ApplicationRecord

	has_and_belongs_to_many :users
	has_many :material_requirements
	belongs_to :region
	scope :active, -> { where(Active: true) }

	validates :region_id, presence: true
end
