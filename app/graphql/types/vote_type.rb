# frozen_string_literal: true

module Types
  class VoteType < Types::BaseObject
    description 'Votes information'
    field :id, Integer, null: false
    field :user_id, Integer, null: false
    field :date, String, null: false
    field :nominee, Types::NomineeType, null: false
  end
end
