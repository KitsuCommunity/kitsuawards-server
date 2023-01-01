# frozen_string_literal: true

# == Schema Information
#
# Table name: votes
#
#  id               :bigint           not null, primary key
#  date             :datetime         not null
#  nominee_id       :bigint           not null
#  subcategories_id :bigint
#  user_id          :integer          not null
#
# Indexes
#
#  index_votes_on_nominee_id        (nominee_id)
#  index_votes_on_subcategories_id  (subcategories_id)
#
# Foreign Keys
#
#  fk_rails_...  (nominee_id => nominees.id)
#
class Vote < ApplicationRecord
  belongs_to :nominee
  validates :user_id, uniqueness: { message: 'already voted', scope: %i[subcategories_id] }
end
