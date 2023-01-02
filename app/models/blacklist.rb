# frozen_string_literal: true

# == Schema Information
#
# Table name: blacklists
#
#  id                     :bigint           not null, primary key
#  acc_default_pfp        :boolean          default(FALSE)
#  acc_non_verified_email :boolean          default(FALSE)
#  acc_not_enough_entries :boolean          default(FALSE)
#  acc_too_recent         :boolean          default(FALSE)
#  username               :string           not null
#  verified               :boolean
#  user_id                :integer          not null
#
class Blacklist < ApplicationRecord
  validates :user_id, uniqueness: true
end
