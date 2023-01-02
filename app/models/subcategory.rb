# frozen_string_literal: true

# == Schema Information
#
# Table name: subcategories
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  category_id :bigint           not null
#
# Indexes
#
#  index_subcategories_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
class Subcategory < ApplicationRecord
  belongs_to :category
  has_many :nominees
end
