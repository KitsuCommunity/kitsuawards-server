module Types
    class CategoryType < Types::BaseObject
        description "Categories informations"
        field :id,    Integer, null:false
        field :name, String, null: false
        field :url, String, null: false
        field :subcategories, [Types::SubcategoryType], null: false
    end
end
