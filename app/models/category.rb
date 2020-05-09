class Category < ApplicationRecord
    belongs_to :year
    has_many :subcategories
end
