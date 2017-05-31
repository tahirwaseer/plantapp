class Plant < ApplicationRecord

	has_and_belongs_to_many :users
	has_many :material_requirements

	scope :active, -> { where(active: true) }
end
