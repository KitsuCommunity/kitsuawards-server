# frozen_string_literal: true

# == Schema Information
#
# Table name: nominees
#
#  id             :bigint           not null, primary key
#  media          :string           not null
#  name           :string           not null
#  subcategory_id :bigint           not null
#
# Indexes
#
#  index_nominees_on_subcategory_id  (subcategory_id)
#
# Foreign Keys
#
#  fk_rails_...  (subcategory_id => subcategories.id)
#
class Nominee < ApplicationRecord
  belongs_to :subcategory
  has_many :votes
end
