class Vote < ApplicationRecord
    belongs_to :nominee
    validates :user_id, :uniqueness => {:scope => [:subcategories_id], message: "already voted"}
end 