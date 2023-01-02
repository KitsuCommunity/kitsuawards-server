# frozen_string_literal: true

# == Schema Information
#
# Table name: judges
#
#  id      :bigint           not null, primary key
#  user_id :integer          not null
#  year_id :bigint           not null
#
# Indexes
#
#  index_judges_on_year_id  (year_id)
#
# Foreign Keys
#
#  fk_rails_...  (year_id => years.id)
#
class Judge < ApplicationRecord
  belongs_to :year
end
