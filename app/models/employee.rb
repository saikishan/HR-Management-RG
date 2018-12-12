class Employee < ApplicationRecord
    belongs_to :team
    has_and_belongs_to_many :skills
end
