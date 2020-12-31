class Nominee < ApplicationRecord
    belongs_to :subcategory
    has_many :votes
end