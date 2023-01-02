# frozen_string_literal: true

# == Schema Information
#
# Table name: years
#
#  id           :bigint           not null, primary key
#  description  :string           not null
#  end          :datetime         not null
#  show_results :boolean          default(FALSE)
#  start        :datetime         not null
#
class Year < ApplicationRecord
  has_many :categories
  has_many :judges
end
