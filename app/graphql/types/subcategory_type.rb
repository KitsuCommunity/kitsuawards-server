# frozen_string_literal: true

module Types
  class SubcategoryType < Types::BaseObject
    description 'Subcategories information'
    field :id, Integer, null: false
    field :name, String, null: false
    field :nominees, [Types::NomineeType], null: false
  end
end
