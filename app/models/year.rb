class Year < ApplicationRecord
    has_many :categories
    has_many :judges
end