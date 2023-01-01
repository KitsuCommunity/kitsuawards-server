# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id      :bigint           not null, primary key
#  end     :datetime
#  name    :string           not null
#  start   :datetime
#  url     :string           not null
#  year_id :bigint           not null
#
# Indexes
#
#  index_categories_on_year_id  (year_id)
#
# Foreign Keys
#
#  fk_rails_...  (year_id => years.id)
#
class Category < ApplicationRecord
  belongs_to :year
  has_many :subcategories
end
