# frozen_string_literal: true

module Types
  class JudgeType < Types::BaseObject
    description 'Judges information'
    field :id, Integer, null: false
    field :user_id, ID, null: false
  end
end
