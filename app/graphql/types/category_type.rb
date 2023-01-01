# frozen_string_literal: true

module Types
  class CategoryType < Types::BaseObject
    description 'Categories information'
    field :id, Integer, null: false
    field :name, String, null: false
    field :url, String, null: false
    field :start, String, null: false
    field :end, String, null: false
    field :subcategories, [Types::SubcategoryType], null: true

    def subcategories
      return unless Time.zone.now >= object.start

      object.subcategories
    end
  end
end
